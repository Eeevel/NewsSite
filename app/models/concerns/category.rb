module Category
  extend ActiveSupport::Concern

  VALID_CATEGORIES = %w[people technology culture politics sport religion economics auto].freeze

  included do
    validates :category, presence: true, inclusion: { in: VALID_CATEGORIES }
  end
end
