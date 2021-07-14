class Article < ApplicationRecord
  include Status
  include Category

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :short_description, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :news_main_image, presence: true
  validates :region, presence: true

  mount_uploader :news_main_image, NewsMainImageUploader
end
