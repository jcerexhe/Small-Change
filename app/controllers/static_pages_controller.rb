class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def faq
  end

  def about_the_founders
  end

  def how_it_works
  end

  def situation_at_a_glance
    
    # When we need to get information from the database e.g. donation total, 
    # user total, number of small change donations, number of partnered charities,
    # Ill need to specify that here.
  end

  def thanks
    @donation = Donation.find(params[:donation])
  end

  def choose_charity
    @submission = Submission.find(params[:submission])
    @causes = Cause.all
    if params[:cause]
      @charities = Cause.find(params[:cause]).charities
    else
      @charities = Charity.all
    end
    if params[:charity]
      @charity = Charity.find(params[:charity])
    end

  end

  def update_charity
    Submission.find(params[:submission]).update_attribute(:charity, id)
  end



  def charity_tree
   @causes = Cause.all
   @charities = Charity.all
  end



  def t_and_c
    
  end

  def contact_us
    @enquiry = Enquiry.new
  end

  def our_goal
  end

  def I_am_a_charity
   @enquiry = Enquiry.new
  end

  def I_am_a_news_organisation
    @enquiry = Enquiry.new
  end

  def sc_donation
  end

  def my_small_change
    @submissions = Submission.all.paginate(:page => params[:page], :per_page => 3)
  end

end
