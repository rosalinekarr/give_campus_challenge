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
  end
end
