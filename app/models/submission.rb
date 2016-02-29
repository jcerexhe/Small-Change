class Submission < ActiveRecord::Base
  has_many :user_submissions, dependent: :destroy
  has_many :users, through: :user_submissions, dependent: :destroy
  has_many :charities, through: :user_submissions
  has_many :donations, through: :user_submissions
  has_many :causes, through: :user_submissions

  scope :link_clicks_desc, -> { order(:link_clicks => :desc) }


  
    extend FriendlyId
    friendly_id :title, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :description],
      [:title, :description, :submission_type],
    ]
  end

end
