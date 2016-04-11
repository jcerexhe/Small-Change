class DonationsMailerJob
  include SuckerPunch::Job

  def perform(donation_id)
    ActiveRecord::Base.connection_pool.with_connection do
      DonationsMailer.donation_confirmation(donation_id).deliver_now
    end
    # raise NotImplementedError
  end
end