require 'rails_helper'

RSpec.describe DollarForDollarMatch, type: :model do
  describe "#match" do
    it "creates a new donation" do
      donation = FactoryBot.create :donation
      match = FactoryBot.create :dollar_for_dollar_match
      expect{ match.match(donation) }.to change{ Donation.count }.by(1)
    end

    it "creates a new donation with the same dollar value" do
      donation = FactoryBot.create :donation
      match = FactoryBot.create :dollar_for_dollar_match
      match.match(donation)
      expect(Donation.last.amount).to eq(donation.amount)
    end
  end
end
