class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @amount = params[:amount]
    @dollar_amount = @amount.to_i / 100
    @submission = Submission.find(params[:submission])
    @charity = Charity.find(params[:charity])

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @charity.name,
        :currency    => 'aud',
      )

      if charge['paid']
        @donation = Donation.create(amount: @dollar_amount, submission_id: @submission.id, charity_id: @charity.id, user_id: current_user.id )
         DonationsMailer.new_donation_notification(@donation.id, customer).deliver_now

        if current_user
        redirect_to new_user_registration_path
         else
        redirect_to thanks_path(donation: @donation.id)
      end
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :back
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
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
