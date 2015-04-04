class MenuController < ApplicationController

  def student

  end

  def staff

  end

  def guest

  end

  def housing_vacancy
    permission_denied if !is_login?

    the_list = []
    builds_apts = BuildingsApt.all

    builds_apts.each do |b|
      the_list << {:unit_no => b.unit_no, :vacancy => Room.where(:unit_no => b.unit_no,
                :lease_no => nil).count}
    end

    # add family apartments
    the_list << {:unit_no => 'Family housing', :vacancy => FamilyApt.where(:lease_no => nil).count}

    @the_list = the_list
  end

end