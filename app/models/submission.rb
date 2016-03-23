class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :charity
  has_many :donations

  extend FriendlyId
  friendly_id :title, use: :slugged

  is_impressionable

  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }
  # scope :most_viewed, -> { order(:impressionist_count => :desc) }
  scope :most_recent, -> { order(:created_at => :desc) }

  # def self.most_viewed
    # self.impressionist_count.order(:desc)
  # end
end
