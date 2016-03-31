class UserMailer < ApplicationMailer
  def signup(user_id)
    @user = User.find(user_id)
    mail to: @user.email, subject: "Welcome to Small Change"
  end
end
