class Cause < ActiveRecord::Base
	has_many :charities
	has_many :user_submissions
	has_many :submissions, through: :user_submissions
	has_many :donations, through: :user_submissions
	has_many :users, through: :user_submissions
end
