class ChartsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    authorize :chart
  end
end
