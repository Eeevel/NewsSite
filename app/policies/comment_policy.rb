class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user == comment.user
  end

  def destroy?
    user&.admin? || user == comment.user
  end

  private

  def comment
    record
  end
end
