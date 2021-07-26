class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @articles = @tag.articles.order('updated_at DESC')
  end
end