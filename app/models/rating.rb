class Rating < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :number, presence: true, numericality: { only_integer: true }
end
