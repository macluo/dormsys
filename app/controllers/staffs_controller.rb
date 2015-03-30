class StaffsController < ApplicationController

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      redirect_to @staff
    else
      render 'new'
    end

  end

  def show
    @staff = Staff.find(params[:sid])
  end

  def index
    @staff = Staff.all
  end

  def update
    @staff = Staff.find(params[:sid])

    if @staff.update(staff_params)
      redirect_to @staff
    else
      render 'edit'
    end
  end

  def destroy
    @staff = Staff.find(params[:sid])
    @staff.destroy

    redirect_to staffs_path
  end

  private #Variables after this line will be private only!
  def article_params
    params.require(:staff).permit(:sid)
  end

end