class User < ApplicationRecord
  enum role: %i[user admin redactor correspondent], _default: :user

  has_many :articles
  has_many :comments
  has_many :ratings
  has_many :viewings
  has_many :subscriptions
  has_many :reports

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :address, presence: true
  validates :date_of_birth, presence: true
  validates :avatar, presence: true

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    user ||= User.create(email: access_token.info.email,
                         password: Devise.friendly_token[0, 20]) do |u|
      u.first_name = access_token.info.name.split.first
      u.last_name = access_token.info.name.split.last
      u.nickname = access_token.info.nickname
      u.address = access_token.info.location || 'Belarus'
      u.date_of_birth = '1970-01-01'
      u.avatar = File.open('app/assets/images/default_avatar.jpg')
      u.uid = access_token.uid
      u.provider = access_token.provider
      u.skip_confirmation!
    end
    user.save
    user
  end
end
