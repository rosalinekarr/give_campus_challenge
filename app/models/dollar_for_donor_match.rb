class DollarForDonorMatch < Match
  MINIMUM_AMOUNT = 1.00
  MAXIMUM_AMOUNT = 1_000_000.00

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: MINIMUM_AMOUNT }
  validates :amount, numericality: { less_than_or_equal_to:    MAXIMUM_AMOUNT }

  def match(donation)
    Donation.create(amount: self.amount)
  end
end
