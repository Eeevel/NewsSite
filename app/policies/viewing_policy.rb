class ViewingPolicy < ApplicationPolicy
  def create?
    user.present? && !user.viewings.find_by(article: viewing.article)
  end

  private

  def viewing
    record
  end
end
