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

end