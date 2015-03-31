class SessionsController < ApplicationController

  current_user.guest = true
  current_user.student = false
  current_user.adm = false

  def new

  end

end