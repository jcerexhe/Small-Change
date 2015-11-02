# Preview all emails at http://localhost:3000/rails/mailers/enquiries_mailer
class EnquiriesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enquiries_mailer/new_enquiry_notification
  def new_enquiry_notification
    EnquiriesMailer.new_enquiry_notification
  end

end
