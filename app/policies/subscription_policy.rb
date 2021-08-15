class SubscriptionPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user == subscription.user
  end

  def destroy?
    user.present? && user == subscription.user
  end

  private

  def subscription
    record
  end
end
