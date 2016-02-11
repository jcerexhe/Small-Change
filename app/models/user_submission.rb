class UserSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission, dependent: :destroy
  belongs_to :charity
  belongs_to :donation
  belongs_to :cause


end
