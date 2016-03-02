class DashboardController < ApplicationController
  def show
    @submissions = current_user.submissions
    @submissions_actions = @submissions.sum(:link_clicks)
    @user_actions = current_user.actions_taken
    @submission = Submission.new

    @users = User.all
    @total_actions_taken = @users.sum(:actions_taken)
  end
end
