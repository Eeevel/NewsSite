class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    CreateCommentsService.call(comment_params, current_user, @article)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    DestroyCommentsService.call(params[:id], current_user, @article)
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
