class Article < ApplicationRecord
  include Status
  include Category

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :short_description, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :region, presence: true
end
