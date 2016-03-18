class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :charity
  has_many :donations

  extend FriendlyId
  friendly_id :title, use: :slugged

  is_impressionable

  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }
end
