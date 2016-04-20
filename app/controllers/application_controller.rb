class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :mobile, :email, :password, :admin, :terms_of_service, :mailing_list, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email) }
  end

end

