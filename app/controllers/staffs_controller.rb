class StaffsController < ApplicationController

  def new
    @person = Person.new
    @person.build_staff
  end

  def create
    @person = Person.new(staff_params)
    @person.build_staff(staff_params[:staff_attributes]) #nested parameters

    if @person.save
      redirect_to :action => 'show', :id => @person.pid
    else
      render 'new'
    end

  end

  def show
    @person = Person.find(params[:id])
  end

  def index
    @staff = Staff.all
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update(staff_params)
      redirect_to @staff
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:sid])
    @person.destroy

    redirect_to staffs_path
  end

  private #Variables after this line will be private only!
  def staff_params
    params.require(:person).permit! # allow mass params for now
  end

end