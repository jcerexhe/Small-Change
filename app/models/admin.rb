class Admin < ActiveRecord::Base
  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }
  scope :most_recent, -> { order(:created_at => :desc) }
end