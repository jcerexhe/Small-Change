class Donation < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  belongs_to :charity

  after_create :send_confirmation

  def send_confirmation
    DonationsMailerJob.perform_async(self.id)
  end
end
