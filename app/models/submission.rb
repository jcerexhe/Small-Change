class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :charity
  belongs_to :cause
  has_many :donations
end
