class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #helper_method :current_user

  def permission_denied

    redirect_to root_url if !is_login?

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

  def is_adm?
    (current_user == "staff")
  end

  def is_student?
    (current_user == 'student')
  end

  def is_guest?
    (current_user == 'guest')
  end

  def is_login?
    return (session[:user] != nil)
  end

  # use numerical value to represent the current semester
  def current_semester
    5 # 2015, Spring
  end

  def current_semester_end_date
    "2015-07-31"
  end

  def semester_list
    Semester.all
  end

  def housing_vacant_list
    the_list = []
    builds_apts = BuildingsApt.all

    builds_apts.each do |b|
      the_list << {:unit_no => b.unit_no, :vacancy => Room.where(:unit_no => b.unit_no,
                                                                 :occupant => nil).count}
    end

    # add family apartments
    the_list << {:unit_no => 'Family housing', :vacancy => FamilyApt.where(:occupant => nil).count}
  end

  def parking_vacant_list
    the_list = []
    parking = ParkingLot.all

    parking.each do |p|
      the_list << {:unit_no => p.lot_no, :vacancy => ParkingSpot.where(:lot_no => p.lot_no, :occupant => nil).count}
    end

    the_list
  end

  # only works for student users, staff will return false
  def has_active_lease?
    signed_lease = SignedLease.where("sid = ? AND end_sem <= ?", current_user_id, current_semester)
    return (signed_lease.length > 0)
  end

  def get_active_lease
    return SignedLease.where("sid = ? AND end_sem <= ?", current_user_id, current_semester).first
  end

  def get_active_lease(sid)
    return SignedLease.where("sid = ? AND end_sem <= ?", sid, current_semester).first
  end

end
