class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @user.save
      redirect_to users_path(@employee)
    else
      render :new
    end
  end

  def show
  end

  def index
    @Employee = Employee.all
    respond_to do |format|
      format.html

      format.pdf { render pdf: "employees", template: "employees/employees_pdf.html.erb", layout: "pdf.html.erb"}
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to users_path(@employee)
    else
      render :new
    end
  end

  def destroy
    if @employee.destroy
      redirect_to users_path
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email, :phone_no)
    end

    def find_user
      @employee = Employee.find(params[:id])
    end
end
