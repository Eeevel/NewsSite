class CreateRatingsService < ApplicationService
  attr_reader :params, :user, :article

  def initialize(params, user, article)
    @params = params
    @user = user
    @article = article
  end

  def call
    rating = Rating.new(@params)
    rating.user = @user
    rating.article = @article
    Pundit.authorize @user, rating, :create?
    rating.save
  end
end
