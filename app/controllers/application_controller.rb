class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #helper_method :current_user

  #def permission_denied
  #  redirect_to root_url, alert => 'Permission denied'
  #end

  private
  # Based on http://railscasts.com/episodes/250-authentication-from-scratch
  def current_user_id
    @current_user_id ||= Person.find_by_pid(session[:pid]) if session[:pid]

    # Default to Guest user
    # @current_user ||= Guest.new
  end

  def current_user
    @current_user = session[:user]
  end

  # use numerical value to represent the current semester
  def current_semester

  end

end
