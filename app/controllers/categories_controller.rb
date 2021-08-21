class CategoriesController < ApplicationController
  def show
    @category = params[:id]
    @articles = Article.order('updated_at DESC').where("category = ? and status = 'published'", @category)
  end
end
