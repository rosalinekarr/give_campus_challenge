class DollarForDonorMatch < Match
  MINIMUM_AMOUNT = 1.00
  MAXIMUM_AMOUNT = 1_000_000.00

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: MINIMUM_AMOUNT }
  validates :amount, numericality: { less_than_or_equal_to:    MAXIMUM_AMOUNT }

  def match(donation)
    if (self.amount + self.total_donated) < self.maximum
      amount = self.amount
    else
      amount = self.maximum - self.total_donated
    end
    Donation.create(amount: amount, match: self) if amount > 0.0
  end
end
