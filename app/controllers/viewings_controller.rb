class ViewingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @viewing = Viewing.new(viewing_params)
    @viewing.user = current_user
    @viewing.article = @article
    authorize @viewing
    @viewing.save
    redirect_to article_path(@article)
  end

  private

  def viewing_params
    params.require(:viewing).permit(:view)
  end
end
