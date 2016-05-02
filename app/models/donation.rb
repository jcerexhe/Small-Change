class Donation < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  belongs_to :charity

  scope :most_recent, -> { order(:created_at => :desc) }
  scope :amount_size, -> { order(:amount => :desc) }

  after_create :send_confirmation

  def send_confirmation
    DonationsMailerJob.perform_async(self.id)
  end

  def self.to_csv
    attributes = %w{amount first_name last_name submission_url created_at email phone}
    CSV.generate do |csv|
      csv << attributes
      all.each do |donation|
        csv << donation.attributes.values_at(*attributes)
      end
    end
  end

end
