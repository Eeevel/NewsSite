class RssFeed < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true
end
