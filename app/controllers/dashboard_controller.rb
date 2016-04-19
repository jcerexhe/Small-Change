class DashboardController < ApplicationController
  def show
    @submissions = current_user.submissions if current_user.submissions
    @submission = Submission.new
    @submission_count = current_user.submissions.count
    @donations = Donation.all
    @link_clicks = current_user.submissions.sum(:link_clicks).to_i
    @users = User.all
    @charity= Charity.find(current_user.charity_id) if current_user.charity_id.present?

    # Amount user has donated to charity
    @donation_total = current_user.donations.sum(:amount).to_i / 100
    @donation_count = current_user.donations.count

    @featured_submissions = Submission.last(3)

    # Number of views a user has gotten on all their submissions
    count = 0
    current_user.submissions.each do |submission|
      count = count + submission.impressionist_count
    end
    @views = count

    # Amount user has raised through all their submissions
    # Should be decimal not integer [FIX]
    @amount_raised = Donation.where(user_id: current_user.id).sum(:amount).to_i / 100

    # Rank
    user_donations = Hash.new
    # .find_each uses batches of 1000 so that it doesn't instantiate all the objects at once
    @users.find_each do |user|
        d = Donation.where(user_id: user.id).sum(:amount).to_i
        user_donations.store(user_id, d)
    end
    sorted = user_donations.sort_by{|k, v| v}.reverse.to_h
    sorted_keys = sorted.keys
    @rank = sorted_keys.index(current_user.id) + 1

    def possessive
        self + case self[-1,1]
        when 's' then "'"
            else "'s"
        end
    end
  end
end
