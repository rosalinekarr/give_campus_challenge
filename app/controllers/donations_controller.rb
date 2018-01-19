class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to root_path, notice: t('.thank_you')
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :name)
  end
end
