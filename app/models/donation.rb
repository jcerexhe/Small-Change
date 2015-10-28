class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  belongs_to :charity
  belongs_to :submission
end
