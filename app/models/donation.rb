class Donation < ActiveRecord::Base
  has_one :submission, through: :user_submissions
  has_one :user, through: :user_submissions
  # has_one :user, through: :user_submissions
  has_one :charity, through: :user_submissions
  has_one :cause, through: :user_submissions
end
