require 'log4r'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    # devise_parameter_sanitizer.for(:sign_up) do |u|
    #   u.permit(:name, :email, :password, :password_confirmation,:username, :firstname, :lastname, :Address1, :Address2, :city, :region, :contact, :DOB, :gender)
    # end
    devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:name, :email, :password, :password_confirmation,:username, :firstname, :lastname, :Address1, :Address2, :city, :region, :contact, :DOB, :gender)}
    devise_parameter_sanitizer.for(:sign_in){|u| u.permit(:login, :username, :email, :password, :remember_me)}
  end

end
