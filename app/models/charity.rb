class Charity < ActiveRecord::Base
		# belongs_to :submission
		# has_many :user_submissions
		has_many :submissions
		has_many :donations
		# has_many :users, through: :user_submissions
    # mount_uploader :choose_charity_logo, ChooseCharityLogoUploader
end
