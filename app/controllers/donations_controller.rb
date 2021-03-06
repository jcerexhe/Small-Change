class DonationsController < ApplicationController
  before_action :set_donation, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:create, :thanks]
  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @users = User.all
    @charity_categories = CharityCategory.all
    @charity = Charity.find(current_user.charity_id)

    @unique_sellable_users = []
    email_list = []
    @donations_time_ordered = Donation.all.most_recent

    @donations_time_ordered.reverse.each do |d|
      if d.charity_id == @charity.id && d.contact_me == true && d.paid == nil && !email_list.include?(d.email)
        @unique_sellable_users << d
        email_list << d.email
      elsif d.charity_id == @charity.id && d.contact_me && d.paid == true
        email_list << d.email
      end
    end


    special_charities = ["Cancer Council", "Greenpeace"]
    special_charities.each do |special_charity|
      if special_charity == Charity.find(current_user.charity_id).name
        @special_charity = true
        break
      end
    end

    if user_signed_in?
      if current_user.charity_id
        @charity = Charity.find(current_user.charity_id)
        if params[:most_recent]
          @donations= Donation.where(charity_id: current_user.charity_id).most_recent
        elsif params[:amount]
          @donations=Donation.where(charity_id: current_user.charity_id).amount_size
        else
          @donations = Donation.where(charity_id: current_user.charity_id)
      end
        respond_to do |format|
          format.html
          if @special_charity
            format.csv { send_data @donations.to_csv_special }
          else
            format.csv { send_data @donations.to_csv_normal}
          end
        end
      end
    end
  end

  def thanks
    if user_signed_in?
      @donation = current_user.donations.last
    else
      @donation = Donation.where(email: params[:email]).last
      @email = @donation.email if @donation.email
    end
    @charity = Charity.find(@donation.charity_id)
    @amount = @donation.amount / 100
    @submission = @donation.submission
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.save!
    redirect_to thanks_path
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
      params.require(:donation).permit(:amount, :charity_id, :user_id, :submission_id, :email, :first_name, :last_name, :phone, :submission_url, :charity_category_id, :contact_me, :paid)
    end
end
