class Donation < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  # has_one :user, through: :user_submissions
  belongs_to :charity
  # has_one :cause, through: :user_submissions
end
