class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  	@submission = Submission.new
  end
end
