require 'rMeetupAPI'

class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to :controller => 'dashboard', :action => 'index'
    end
    @rmeetupResult = RMeetupAPI::RMeetAPIClass.new.rMeetupAPIFunction()
  end

  protect_from_forgery
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :resource, :resource_name, :devise_mapping

end
