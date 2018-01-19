class DonationsController < ApplicationController
  def new
    @donation = Donation.new(amount: 1.00)
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      match_donation
      redirect_to root_path, notice: t('.thank_you')
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :name)
  end

  def match_donation
    Match.find_each do |match|
      match.match(@donation)
    end
  end
end
