class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #helper_method :current_user

  def permission_denied
    case current_user
      when 'staff'
        redirect_to menu_staff_url, alert => 'Permission denied'
      when 'student'
        redirect_to menu_student_url, alert => 'Permission denied'
      when 'guest'
        redirect_to menu_guest_url, alert => 'Permission denied'
    end
  end

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
    5 # 2015, Spring
  end

  def is_adm?
    (current_user == "staff")
  end

  def is_student?
    (current_user == 'student')
  end

  def is_guest?
    (current_user == 'guest')
  end

end
