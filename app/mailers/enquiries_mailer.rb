class EnquiriesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiries_mailer.new_enquiry_notification.subject
  #
  def new_enquiry_notification(enquiry_id)
   @enquiry = Enquiry.find(enquiry_id)
  	mail to: @enquiry.email, subject: "We received your Small Change enquiry"
  end

  def admin_enquiry_notification(enquiry_id)
  	 @enquiry = Enquiry.find(enquiry_id)
  	mail to: "hendersonsam456@gmail.com", subject: "An enquiry was made"
  end
  
end
