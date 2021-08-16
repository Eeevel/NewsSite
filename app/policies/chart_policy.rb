class ChartPolicy < ApplicationPolicy
  def index?
    user&.admin?
  end
end
