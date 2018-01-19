require 'rails_helper'

RSpec.describe DollarForDonorMatch, type: :model do
  describe "validation" do
    it "has a valid factory" do
      match = FactoryBot.build :dollar_for_donor_match
      expect(match).to be_valid
    end

    it "validates amount presence" do
      match = FactoryBot.build :dollar_for_donor_match, amount: nil
      expect(match).not_to be_valid
    end

    it "validates the amount is not less than $1" do
      match = FactoryBot.build :dollar_for_donor_match, amount: 0.99
      expect(match).not_to be_valid
    end

    it "validates the amount is not more than $1,000,000.00" do
      match = FactoryBot.build :dollar_for_donor_match, amount: 1_000_000.01
      expect(match).not_to be_valid
    end
  end

  describe "#match" do
    it "creates a new donation" do
      donation = FactoryBot.create :donation
      match = FactoryBot.create :dollar_for_donor_match
      expect{ match.match(donation) }.to change{ Donation.count }.by(1)
    end

    it "creates a new donation with the fixed amount" do
      donation = FactoryBot.create :donation
      match = FactoryBot.create :dollar_for_donor_match
      match.match(donation)
      expect(Donation.last.amount).to eq(match.amount)
    end
  end
end
