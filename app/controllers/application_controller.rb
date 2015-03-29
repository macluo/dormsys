class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #helper_method :current_user

  #def permission_denied
  #  redirect_to root_url, alert => 'Permission denied'
  #end

  #private
  # Based on http://railscasts.com/episodes/250-authentication-from-scratch
  #def current_user
  #  @current_user ||= Person.find_by(id: session[:user_id]) if session[:user_id]

    # Default to Guest user
    # @current_user ||= Guest.new
  #end

end
