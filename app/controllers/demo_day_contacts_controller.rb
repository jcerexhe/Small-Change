class DemoDayContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @demo_day_contact = DemoDayContact.new(demo_day_contact_params)
    @demo_day_contact.save
    respond_to do |format|
      format.html { redirect_to root_url(clear:true) }
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def demo_day_contact_params
    params.require(:demo_day_contact).permit(:email, :message)
  end
end
