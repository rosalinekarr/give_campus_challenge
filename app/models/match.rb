class Match < ApplicationRecord
  MINIMUM_MAXIMUM = 1.00
  MAXIMUM_MAXIMUM = 1_000_000.00

  validates :maximum, presence: true
  validates :maximum, numericality: { greater_than_or_equal_to: MINIMUM_MAXIMUM }
  validates :maximum, numericality: { less_than_or_equal_to:    MAXIMUM_MAXIMUM }
end
