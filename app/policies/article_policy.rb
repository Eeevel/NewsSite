class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user&.admin? || user&.redactor? || user&.correspondent? || article.status == 'published'
  end

  def create?
    user&.correspondent?
  end

  def update?
    user&.redactor? || (user&.correspondent? && user == article.user && article.status != 'published')
  end

  def destroy?
    user&.admin? || user&.redactor? || (user&.correspondent? && user == article.user && article.status != 'published')
  end

  private

  def article
    record
  end
end
