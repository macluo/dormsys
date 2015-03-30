class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end

  end

  def show
    @student = Student.find(params[:sid])
  end

  def index
    @student = Student.all
  end

  def update
    @student = Student.find(params[:sid])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:sid])
    @student.destroy

    redirect_to students_path
  end

  private #Variables after this line will be private only!
  def student_params
    params.require(:student).permit(:sid, :s_type, :s_status, :smoke, :spec_sneeds, :category, :kin_fname,
    :kin_middle_name, :kin_lname, :kin_phone, :kin_street, :kin_city, :kin_country, :add_comment)
  end

end