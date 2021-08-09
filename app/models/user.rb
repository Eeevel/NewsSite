class User < ApplicationRecord
  enum role: %i[user admin redactor correspondent], _default: :user

  has_many :articles
  has_many :comments
  has_many :ratings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :address, presence: true
  validates :date_of_birth, presence: true
  validates :avatar, presence: true

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
end
