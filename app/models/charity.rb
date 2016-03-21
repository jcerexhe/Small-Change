class Charity < ActiveRecord::Base
		has_many :submissions
		has_many :donations
    # mount_uploader :choose_charity_logo, ChooseCharityLogoUploader
end
