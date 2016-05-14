class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @charities = Charity.all
  end

  def show
    @users = User.all
    @charities = Charity.all
    @charity = Charity.find(params[:id])
    @charity_categories = CharityCategory.all
    @submission = Submission.new
    @submissions = Submission.all
    @donations_with_double_ups = Donation.where(charity_id: @charity.id, contact_me: true, paid: nil)
    @unique_sellable_users = []
    email_list = []

    @donations_with_double_ups.each do |d|
      unless email_list.include?(d.email)
        @unique_sellable_users << d
      end
      email_list << d.email
    end
    @donations = @unique_sellable_users
    respond_to do |format|
      format.html
      format.csv { send_data @donations.to_csv}
    end
  end

  def new
    @charity = Charity.new
  end

  def edit
  end

  def create
    @charity = Charity.new(charity_params)

    respond_to do |format|
      if @charity.save
        format.html { redirect_to @charity, notice: 'Charity was successfully created.' }
        format.json { render :show, status: :created, location: @charity }
      else
        format.html { render :new }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @charity.update(charity_params)
        format.html { redirect_to @charity, notice: 'Charity was successfully updated.' }
        format.json { render :show, status: :ok, location: @charity }
      else
        format.html { render :edit }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @charity.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path(charities: true), notice: 'Charity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charity
      @charity = Charity.find(params[:id])
    end

    def authenticate_admin
      unless current_user.admin == true
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charity_params
      params.require(:charity).permit(:name, :bsb, :account_number, :contact_name, :contact_email, :url,:cause_id, :logo, :blurb)
    end
end
