class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :terms_of_service, acceptance: { accept: true }

  has_many :submissions
  has_many :donations

  after_create :send_welcome_email, :add_existing_donations

  def send_welcome_email
    UserMailer.signup(self.id).deliver
  end

  def add_existing_donations
    Donation.where(email: self.email).each do |donation|
      donation.update_attributes(user_id: self.id)
    end
  end
end
