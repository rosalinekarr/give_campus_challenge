class DollarForDollarMatch < Match
  def match(donation)
    if (donation.amount + self.total_donated) < self.maximum
      amount = donation.amount
      amount = self.maximum if amount > self.maximum
    else
      amount = self.maximum - self.total_donated
    end
    Donation.create(amount: amount, match: self) if amount > 0.0
  end
end
