class DestroyCommentsService < ApplicationService
  attr_reader :id, :user, :article

  def initialize(id, user, article)
    @id = id
    @user = user
    @article = article
  end

  def call
    comment = @article.comments.find(@id)
    Pundit.authorize @user, comment, :destroy?
    comment.destroy
  end
end
