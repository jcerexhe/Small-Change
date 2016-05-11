class Donation < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  belongs_to :charity

  scope :most_recent, -> { order(:created_at => :desc) }
  scope :amount_size, -> { order(:amount => :desc) }

  after_create :autofill_donation_record

  def autofill_donation_record
    if self.user_id.present?
      self.update_attributes(email: User.find(self.user_id).email)
      self.update_attributes(first_name: User.find(self.user_id).first_name)
      self.update_attributes(last_name: User.find(self.user_id).last_name)
      self.update_attributes(phone: User.find(self.user_id).mobile) if User.find(self.user_id).mobile.present?
    end
    self.update_attributes(submission_url: Submission.find(self.submission_id).url)
  end

  after_create :send_confirmation


  def send_confirmation
    DonationsMailerJob.perform_async(self.id)
  end


  def self.to_csv_normal
    normal_attributes = %w{amount first_name last_name submission_url created_at contact_me}
    CSV.generate do |csv|
      csv << normal_attributes
      all.each do |donation|
        csv << donation.attributes.values_at(*normal_attributes)
      end
    end
  end

  def self.to_csv_special
    special_attributes = %w{amount first_name last_name submission_url created_at email phone contact_me}
    CSV.generate do |csv|
      csv << special_attributes
      all.each do |donation|
        csv << donation.attributes.values_at(*special_attributes)
      end
    end
  end
end