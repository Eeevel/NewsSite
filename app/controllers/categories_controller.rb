class CategoriesController < ApplicationController
  def show
    @category = params[:id]
    @articles = Article.order('updated_at DESC').where(category: @category, status: :published)
  end
end
