class Match < ApplicationRecord
  MINIMUM_MAXIMUM = 1.00
  MAXIMUM_MAXIMUM = 1_000_000.00

  has_many :donations

  validates :maximum, presence: true
  validates :maximum, numericality: { greater_than_or_equal_to: MINIMUM_MAXIMUM }
  validates :maximum, numericality: { less_than_or_equal_to:    MAXIMUM_MAXIMUM }

  def total_donated
    self.donations.sum(:amount)
  end
end
