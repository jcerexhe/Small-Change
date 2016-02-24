class Submission < ActiveRecord::Base
  def valid?(uri)
    !!URI.parse(uri)
  rescue URI::InvalidURIError
    false
  end

  has_many :user_submissions, dependent: :destroy
  has_many :users, through: :user_submissions, dependent: :destroy
  has_many :charities, through: :user_submissions
  has_many :donations, through: :user_submissions
  has_many :causes, through: :user_submissions

  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }

  validates :url

end
