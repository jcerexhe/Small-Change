class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :terms_of_service, acceptance: { accept: true }

  has_many :submissions
  has_many :donations

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.signup(self.id).deliver
  end

  def add_existing_donations
    # Add existing donations from an email to a new user if the email matches the new user
  end
end
