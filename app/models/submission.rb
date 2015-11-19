class Submission < ActiveRecord::Base
  belongs_to :charity
  belongs_to :cause
  has_many :donations
  has_many :user_submissions
  has_many :users, through: :user_submissions
end
