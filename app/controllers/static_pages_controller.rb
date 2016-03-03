class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about_the_founders, :faq, :update_charity, :choose_submission_type, :charity, :petition, :petition_link, :charity_link, :terms, :contact]

  def about_the_founders
  end

  def admin
    @users = User.all
    @submissions = Submission.all
    @charities = Charity.all
    @donations = Donation.all
  end

  def charity
    submission = Submission.find(params[:id])
    submission.type="charity"
  end

  def charity_link
    @submission = Submission.new
    @submissions = Submission.all
  end 

  def choose_submission_type
    @submission = Submission.find(params[:submission])
  end

  def contact
    @enquiry = Enquiry.new
  end

  def faq
  end

  def petition
    submission = Submission.find(params[:id])
    submission.type="petition"
  end
  
  def petition_link
  @submission = Submission.new
  @submissions = Submission.all
  end 

  def terms
  end

  def update_charity
    @submission = Submission.find(params[:submission])
    @submission.update_attributes(charity: params[:charity])
    redirect_to @submission
  end
end
