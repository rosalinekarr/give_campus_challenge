require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe "validation" do
    it "has a valid factory" do
      donation = FactoryBot.build :donation
      expect(donation).to be_valid
    end

    it "validates amount presence" do
      donation = FactoryBot.build :donation, amount: nil
      expect(donation).not_to be_valid 
    end

    it "validates the amount is not less than $1" do
      donation = FactoryBot.build :donation, amount: 0.99
      expect(donation).not_to be_valid
    end

    it "validates the amount is not more than $1,000,000.00" do
      donation = FactoryBot.build :donation, amount: 1_000_000.01
      expect(donation).not_to be_valid
    end
  end
end
