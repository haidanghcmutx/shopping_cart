class ApplicationController < ActionController::Base
     # Prevent CSRF attacks by raising an exception.
     # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
  def current_cart
    @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
  end
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_up, keys: %i[email name phone address password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email phone address password password_confirmation current_password])
  end
end
