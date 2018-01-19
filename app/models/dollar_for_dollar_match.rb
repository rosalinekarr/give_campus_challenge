class DollarForDollarMatch < Match
  def match(donation)
    Donation.create(amount: donation.amount)
  end
end
