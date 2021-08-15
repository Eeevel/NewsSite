class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    user&.admin? || user&.id == pundit_user.id
  end

  private

  def pundit_user
    record
  end
end
