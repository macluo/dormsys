class SessionsController < ApplicationController

  #current_user.guest = true
  #current_user.student = false
  #current_user.adm = false

  def new

  end

  def guest
    session[:user] = 'guest'
    redirect_to root_url, :notice => 'Guest'
  end

  def create
    user = Person.authenticate(params[:pid], params[:password])

    if user
      session[:pid] = user.pid

      if Staff.exists?(user.pid)
        session[:user] = 'staff'
        redirect_to menu_staff_url, :notice => 'Logged in'
      elsif Student.exists?(user.pid)
        session[:user] = 'student'
        redirect_to menu_student_url, :notice => 'Logged in!'
      end

      #redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid ID or password'
      render 'new'
    end
  end

  def destroy
    session[:pid] = nil
    session[:user] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end

end