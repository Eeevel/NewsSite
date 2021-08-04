class User < ApplicationRecord
  enum role: %i[user admin redactor correspondent], _default: :user

  has_many :articles
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
end
