class AdminController < ApplicationController
  def index
    @users = User.all
    @submissions = Submission.all
    @charities = Charity.all
    @donations = Donation.all
  end
end
