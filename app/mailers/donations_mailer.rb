class DonationsMailer < ApplicationMailer

  def donation_confirmation(donation_id)
    @donation = Donation.find(donation_id)
    @charity = Charity.find(@donation.charity_id)
    @user_email = @donation.user_id ? @donation.user.email : @donation.email
    mail to: @user_email, subject: "Thank you for your donation to #{ @charity.name }"
  end
end