class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :user_submissions, dependent: :destroy
  has_many :submissions
  # has_many :charities, through: :user_submissions
  has_many :donations
  # has_many :causes, through: :user_submissions
end
