class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :terms_of_service, acceptance: { accept: true }
  validates :mobile, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, :presence => true
  
  has_many :submissions
  has_many :donations

  after_create :add_existing_donations

  # def send_welcome_email
  #   UserMailer.signup(self.id).deliver
  # end

  def add_existing_donations
    Donation.where(email: self.email).each do |donation|
      donation.update_attributes(user_id: self.id)
    end
  end
end
