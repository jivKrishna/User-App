class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def show
  end

  def index
     @students = Student.search(params[:search])
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def mail_page
    @student = Student.new
  end

  def send_details
    @students = Student.order(:name).first(50)
    @to = params[:email]

    StudentMailer.send_details(@students, @to).deliver_now
    redirect_to root_path
  end

  private 
    def find_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :phone_number)
    end

end
