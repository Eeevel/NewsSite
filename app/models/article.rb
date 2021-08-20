class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :short_description, type: :text, analyzer: :english
    end
  end

  include Status
  include Category

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :ratings
  has_many :viewings

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
    tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def self.search_articles(query)
    search(
      query: {
        multi_match: {
          query: query,
          fuzziness: 'AUTO',
          fields: %w[title short_description]
        }
      }
    )
  end
end
