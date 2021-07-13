class Article < ApplicationRecord
  include Status

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :short_description, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :region, presence: true
end
