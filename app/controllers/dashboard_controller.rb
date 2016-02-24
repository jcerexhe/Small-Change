class DashboardController < ApplicationController
  def show
    @submissions = current_user.submissions
    @submission = Submission.new
  end
end