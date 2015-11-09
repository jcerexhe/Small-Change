class Charity < ActiveRecord::Base
		has_many :charity_causes
		has_many :causes, through: :charity_causes
		has_many :submissions
		has_many :donations


        mount_uploader :logo, LogoUploader


end
