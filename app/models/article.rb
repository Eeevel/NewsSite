class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :short_description, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :region, presence: true
end
