class SearchController < ApplicationController
  def index
    @search_text = search_params[:query].strip

    if Elasticsearch::Model.client.ping
      @articles = Article.search_articles(@search_text)
    else
      @articles = Article.order('updated_at DESC')
                         .where(status: :published)
                         .where('title LIKE ? OR short_description LIKE ?', "%#{@search_text}%", "%#{@search_text}%")
    end
  end

  private

  def search_params
    params.permit(:query)
  end
end
