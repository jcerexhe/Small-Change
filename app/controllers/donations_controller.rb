class DonationsController < ApplicationController
  before_action :set_donation, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:create, :thanks]
  skip_before_filter :verify_authenticity_token, only: :create

  def thanks
    if user_signed_in?
      @donation = current_user.donations.last

      if current_user != @donation.user
        # Do some redirect
        puts "*" * 80
        puts "Logged in user not same as passed user_id"
        puts "*" * 80
      end

    else
      @donation = Donation.where(email: params[:email]).last
      @email = @donation.email
    end

    @charity = @donation.charity
    @amount = @donation.amount / 100
    @submission = @donation.submission
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.save

    render json: @donation
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:amount, :charity_id, :user_id, :submission_id, :email)
    end
end
