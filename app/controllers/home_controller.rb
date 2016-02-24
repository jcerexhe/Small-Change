class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  	@submission = Submission.new
    @featured_submissions = Submission.link_clicks_desc.limit(3)
  end
end
