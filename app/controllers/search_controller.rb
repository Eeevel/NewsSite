class SearchController < ApplicationController
  def index
    @search_text = search_params[:query].strip
    @articles = Article.order('updated_at DESC').where('title LIKE ?', "%#{@search_text}%")
  end

  private

  def search_params
    params.permit(:query)
  end
end
