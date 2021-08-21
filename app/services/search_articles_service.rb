class SearchArticlesService < ApplicationService
  attr_reader :search_text

  def initialize(search_text)
    @search_text = search_text
  end

  def call
    if Elasticsearch::Model.client.ping
      Article.search_articles(@search_text)
    else
      Article.order('updated_at DESC')
             .where(status: :published)
             .where('title LIKE ? OR short_description LIKE ?', "%#{@search_text}%", "%#{@search_text}%")
    end
  end
end
