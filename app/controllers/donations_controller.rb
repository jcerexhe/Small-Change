class DonationsController < ApplicationController
  before_action :set_donation, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:create, :thanks]
  skip_before_filter :verify_authenticity_token, only: :create

  def thanks
    @charity = Charity.find(params[:charity]) if params[:charity]
    @user = current_user
    @submission = Submission.find(params[:submission]) if params[:submission]
    
  end

  # POST /donations
  # POST /donations.json
  def create
    # @amount = params[:amount]
    # @dollar_amount = @amount.to_i / 100
    # @submission = Submission.find(params[:submission])
    # @charity = Charity.find(params[:charity])
    @donation = Donation.new(donation_params)
    @donation.save

    render json: @donation
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
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
