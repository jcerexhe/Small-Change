class AdminController < ApplicationController
  def index
    @users = User.all
    @submissions = Submission.all
    @charities = Charity.all
    @donations = Donation.all
    @link_clicks = Submission.pluck(:link_clicks).sum
    @donation_total = Donation.all.sum(:amount).to_i
  end
end
