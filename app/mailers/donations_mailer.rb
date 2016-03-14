class DonationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiries_mailer.new_enquiry_notification.subject
  #
  def new_donation_notification(donation_id, customer)
    @donation = Donation.find(donation_id)
    mail to: customer.email, subject: "Thank you for your donation of <%= @donation.amount %>"
  end
end