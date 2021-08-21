class CreateCommentsService < ApplicationService
  attr_reader :params, :user, :article

  def initialize(params, user, article)
    @params = params
    @user = user
    @article = article
  end

  def call
    comment = Comment.new(@params)
    comment.user = @user
    comment.article = @article
    Pundit.authorize @user, comment, :create?
    comment.save
  end
end
