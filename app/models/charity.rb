class Charity < ActiveRecord::Base
	has_many :submissions
	has_many :donations
  has_many :charity_categories
end
