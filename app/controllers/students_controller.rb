class StudentsController < ApplicationController

  def new
    @person = Person.new
    @person.build_student
  end

  def create
    @person = Person.new(student_params)
    @person.build_student(student_params[:student_attributes]) #nested parameters

    if @person.save
      redirect_to :action => 'show', :id => @person.pid
    else
      render 'new'
    end

  end

  def show
    @person = Person.find_by_pid(current_user_id)
    @student = Student.find_by_sid(current_user_id)
  end

  def edit
    @person = Person.find_by_pid(current_user_id)
    @student = Student.find_by_sid(current_user_id)
    @current_user = current_user
  end

  def index
    @student = Student.all
  end

  def update
    @student = Person.find(params[:id])

    if @person.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to students_path
  end

  private #Variables after this line will be private only!
  def student_params
    params.require(:person).permit! # allow mass params for now
  end

end