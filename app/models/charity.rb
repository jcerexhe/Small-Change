class Charity < ActiveRecord::Base
		belongs_to :cause
		has_many :user_submissions
		has_many :submissions, through: :user_submissions
		has_many :donations, through: :user_submissions
		has_many :users, through: :user_submissions


        mount_uploader :choose_charity_logo, ChooseCharityLogoUploader


end
