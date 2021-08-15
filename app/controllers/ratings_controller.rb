class RatingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.article = @article
    authorize @rating
    @rating.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @rating = @article.ratings.find(params[:id])
    authorize @rating
    @rating.destroy
    redirect_to article_path(@article)
  end

  private

  def rating_params
    params.require(:rating).permit(:number)
  end
end
