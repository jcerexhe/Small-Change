class StaticPagesController < ApplicationController
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
end
