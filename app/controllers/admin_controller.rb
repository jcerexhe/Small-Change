class AdminController < ApplicationController
  def index
    @users = User.all
    @submissions = Submission.all
    @charities = Charity.all
    @donations = Donation.all
    @link_clicks = Submission.pluck(:link_clicks).sum
    @donation_total = Donation.all.sum(:amount).to_i / 100
    @most_actioned_submissions = Submission.link_clicks_desc
    @most_recent_submissions = Submission.most_recent

    if params[:most_recent]
      @submissions = @most_recent_submissions
    else
      @submissions = @most_actioned_submissions
    end

    count = 0
    @submissions.each do |submission|
      count = count + submission.impressionist_count
    end
    @views = count
  end
end