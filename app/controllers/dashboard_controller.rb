class DashboardController < ApplicationController
    def show
        @submission = Submission.new
        @featured_submissions = Submission.last(3)

        # if the user is a charity account
        if current_user.charity_id.present?
            #this user's charity
            @charity = Charity.find(current_user.charity_id)
            #the charity category ids this charity has
            @relevant_charity_categories_ids = CharityCategory.where(charity_id: @charity.id).pluck(:id)
            #the submissions that have been connected to this charity
            @submissions = Submission.where(charity_category_id: @relevant_charity_categories_ids)
            #how many submissions have been linked to this charity 
            @submission_count = @submissions.count if @submissions.present?
            #the table of donations this charity has received
            @donations = Donation.where(charity_id: @charity.id)
            #how much money this charity has raised in total
            @amount_raised = @donations.sum(:amount).to_i/100
            #how many individual donations have been made to this charity
            @donation_count = @donations.count
            # Number of views a user has gotten on all the submissions that they've been linked to.
            count = 0
            @submissions.each do |submission|
              count = count + submission.impressionist_count
            end
            @views = count
            @views_title = "The total number of views that all the submissions linked to " + @charity.name + " have received"
            @amount_raised_title = "The amount in donations that " + @charity.name + " has accrued through Small Change"
        # if the user is not a charity account
        else
            @users = User.all
            @views_title = "The total number of views your submissions have received."
            @amount_raised_title = "The amount that all your submissions have accrued in total."
            @submissions = current_user.submissions if current_user.submissions
            @submission_count = current_user.submissions.count
            @donations = Donation.all
            @link_clicks = current_user.submissions.sum(:link_clicks).to_i
            # Amount user has donated to charity
            @donation_total = current_user.donations.sum(:amount).to_i/100
            @donation_count = current_user.donations.count
            # Number of views a user has gotten on all their submissions
            count = 0
            current_user.submissions.each do |submission|
              count = count + submission.impressionist_count
            end
            @views = count
            # Amount user has raised through all their submissions
            # Should be decimal not integer [FIX]
            @amount_raised = Donation.where(user_id: current_user.id).sum(:amount).to_i / 100
            # Rank
            user_donations = Hash.new
            # .find_each uses batches of 1000 so that it doesn't instantiate all the objects at once
            @users.find_each do |user|
                d = Donation.where(user_id: user.id).sum(:amount).to_i
                user_donations.store(user_id, d)
            end
            sorted = user_donations.sort_by{|k, v| v}.reverse.to_h
            sorted_keys = sorted.keys
            @rank = sorted_keys.index(current_user.id) + 1
        end
    end
end
