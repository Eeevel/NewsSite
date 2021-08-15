class Subscription < ApplicationRecord
  enum parameter: %i[category tag region]
  enum frequency: %i[daily every_two_days weekly], _default: :daily

  belongs_to :user

  validates :parameter, presence: true
  validates :name, presence: true
  validates :frequency, presence: true
end
