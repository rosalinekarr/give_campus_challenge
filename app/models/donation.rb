class Donation < ApplicationRecord
  MINIMUM_AMOUNT = 1.00

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: MINIMUM_AMOUNT }
end
