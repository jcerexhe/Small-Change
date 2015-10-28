class Cause < ActiveRecord::Base
	has_many :charity_causes
	has_many :charities, through: :charity_causes
	has_many :submissions
end
