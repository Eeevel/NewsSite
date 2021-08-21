class DestroyRatingsService < ApplicationService
  attr_reader :id, :user, :article

  def initialize(id, user, article)
    @id = id
    @user = user
    @article = article
  end

  def call
    rating = @article.ratings.find(@id)
    Pundit.authorize @user, rating, :destroy?
    rating.destroy
  end
end
