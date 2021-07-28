class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.correspondent?
  end

  def update?
    user&.correspondent? && user == article.user
  end

  def destroy?
    user&.admin? || user&.redactor? || (user&.correspondent? && user == article.user)
  end

  private

  def article
    record
  end
end
