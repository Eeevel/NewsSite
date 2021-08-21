class RatingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    CreateRatingsService.call(rating_params, current_user, @article)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    DestroyRatingsService.call(params[:id], current_user, @article)
    redirect_to article_path(@article)
  end

  private

  def rating_params
    params.require(:rating).permit(:number)
  end
end
