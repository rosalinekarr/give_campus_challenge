require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validation" do
    it "has a valid factory" do
      match = FactoryBot.build :match
      expect(match).to be_valid
    end

    it "validates maximum presence" do
      match = FactoryBot.build :match, maximum: nil
      expect(match).not_to be_valid
    end

    it "validates the maximum is not less than $1" do
      match = FactoryBot.build :match, maximum: 0.99
      expect(match).not_to be_valid
    end

    it "validates the maximum is not more than $1,000,000.00" do
      match = FactoryBot.build :match, maximum: 1_000_000.01
      expect(match).not_to be_valid
    end
  end
end
