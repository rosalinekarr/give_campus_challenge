require 'rails_helper'

RSpec.describe DonationsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      post :create, params: { donation: donation_attributes }
    end

    context "when the donation has a valid amount" do
      let(:donation_attributes) { FactoryBot.attributes_for :donation }

      it "creates a new donation with the given amount" do
        expect(Donation.last.amount).to eq(donation_attributes[:amount])
      end

      it "creates matching donations for dollar for dollar" do
        FactoryBot.create :dollar_for_dollar_match
        expect(Donation.count).to eq(2)
      end

      it "creates matching donations for dollar for donor" do
        match = FactoryBot.create :dollar_for_donor_match
        expect(Donation.last.amount).to eq(match.amount)
      end

      it "redirects to the root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the donation given does not have an amount" do
      let(:donation_attributes) { FactoryBot.attributes_for :donation, amount: nil }

      it "does create a donation" do
        expect(Donation.count).to eq(0)
      end

      it "renders the new form again" do
        expect(response).to render_template(:new)
      end
    end
  end

end
