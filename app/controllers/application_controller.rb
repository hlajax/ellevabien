class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nom, :password, :password_confirmation, :profil])
	devise_parameter_sanitizer.permit(:account_update, keys: [:email, :nom, :password, :password_confirmation, :profil, :current_password])
  end
end
