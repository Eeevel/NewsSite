module Status
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[inactive active published archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def inactive?
    status == 'inactive'
  end

  def active?
    status == 'active'
  end

  def published?
    status == 'published'
  end

  def archived?
    status == 'archived'
  end
end
