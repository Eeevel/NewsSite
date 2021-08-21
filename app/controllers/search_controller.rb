class SearchController < ApplicationController
  def index
    @search_text = search_params[:query].strip
    @articles = SearchArticlesService.call(@search_text)
  end

  private

  def search_params
    params.permit(:query)
  end
end
