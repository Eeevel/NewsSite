class RatingPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && !user.ratings.find_by(article: rating.article)
  end

  def update?
    user.present? && user == rating.user
  end

  def destroy?
    user.present? && user == rating.user
  end

  private

  def rating
    record
  end
end
