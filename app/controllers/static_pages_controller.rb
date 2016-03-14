class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about_the_founders, :faq, :update_charity, :choose_submission_type, :charity, :petition, :petition_link, :charity_link, :terms, :contact]
  before_action :load_submission, only: [:choose_submission_type, :update_charity]

  def about_the_founders
  end

  def admin
    @users = User.all
    @submissions = Submission.all
    @charities = Charity.all
    @donations = Donation.all
  end

  def charity_link
    @submission = Submission.new
    @submissions = Submission.all
  end

  def choose_submission_type
  end

  def faq
  end

  def petition_link
    @submission = Submission.new
    @submissions = Submission.all
  end

  def terms
  end

  def update_charity
    @submission.update_attributes(charity: params[:charity])
    redirect_to @submission
  end

private

  def load_submission
    @submission = Submission.find(params[:submission])
  end
end
