class Submission < ActiveRecord::Base
  # has_many :user_submissions, dependent: :destroy
  belongs_to :user
  belongs_to :charity
  has_many :donations
  # has_many :causes, through: :user_submissions

  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
