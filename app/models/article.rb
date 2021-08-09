class Article < ApplicationRecord
  include Status
  include Category

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :ratings

  enum access_mask: %i[all_content title_and_short_description title nothing], _default: 'all_content'

  validates :title, presence: true
  validates :short_description, presence: true
  validates :body, presence: true
  validates :news_main_image, presence: true
  validates :region, presence: true
  validates :access_mask, presence: true

  mount_uploader :news_main_image, NewsMainImageUploader

  has_rich_text :body

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
