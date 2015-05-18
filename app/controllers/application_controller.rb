class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  require 'date'
  protect_from_forgery with: :exception
  
  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to request.referrer, alert: exception.message
  end
  
  protected

  def after_sign_in_path_for(resource)
    resource.admin? ? users_path : client_landing_path(resource)
  end
  
end
