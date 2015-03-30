class StudentsController < ApplicationController

  def new
    @person = Person.new
    @person.build_student
  end

  def create
    @person = Person.new(student_params)
    @person.build_student(student_params[:student_attributes])

    if @person.save
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
    params.require(:person).permit! # allow mass params
  end

end