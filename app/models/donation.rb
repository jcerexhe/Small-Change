class Donation < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  belongs_to :charity
end
