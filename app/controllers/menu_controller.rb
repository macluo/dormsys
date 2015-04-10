class MenuController < ApplicationController

  def student

  end

  def staff

  end

  def guest

  end

  def housing_vacancy
    permission_denied if !is_login?

    @the_list = housing_vacant_list
  end

  def parking
    if is_adm?
      @signed_lease = SignedLease.find_by_lease_no(params[:id])
      return redirect_to menu_staff_url if @signed_lease.nil?
    else
      @signed_lease = SignedLease.where("sid = ? AND end_date >= ?", current_user_id, Time.now)
      return redirect_to menu_student_url if @signed_lease.count == 0 #exit if no record
      @signed_lease = @signed_lease.first #because it is in an array
    end

    @lease_no = @signed_lease.lease_no
    @person = Person.find_by_pid(@signed_lease.sid)

  end

  private
  def has_pending_request?
    request = ParkingRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}) # pending or reviewing
    if request.count > 0
      return true
    else
      return false
    end
  end

end