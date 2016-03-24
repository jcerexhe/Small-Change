class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about_the_founders, :faq, :update_charity, :choose_submission_type, :terms]
  before_action :load_submission, only: [:choose_submission_type, :update_charity]

  def about_the_founders
  end

  def choose_submission_type
  end

  def faq
  end

  def terms
  end

private

  def load_submission
    @submission = Submission.find(params[:submission])
  end
end
