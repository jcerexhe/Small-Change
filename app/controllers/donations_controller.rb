class DonationsController < ApplicationController
  before_action :set_donation, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:create, :thanks]
  skip_before_filter :verify_authenticity_token, only: :create

  def thanks
    @charity = current_user ? Charity.find_by(Donation.where(user_id=current_user.id).last.charity_id) : Charity.find_by(params[:charity_id])
    @submission = current_user ? Submission.find_by(Donation.where(user_id=current_user.id).last.submission_id) : Submission.find_by(params[:submission_id])
    @donation = Donation.where(user_id=current_user.id).last if current_user
  end

  def create
    # @amount = params[:amount]
    # @dollar_amount = @amount.to_i / 100
    # @submission = Submission.find(params[:submission])
    # @charity = Charity.find(params[:charity])
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
      params.require(:donation).permit(:amount, :charity_id, :user_id, :submission_id)
    end
end
