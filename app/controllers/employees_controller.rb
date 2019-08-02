class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      redirect_to @employee, notice: "An employee is created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def index
    @employees = Employee.search(params[:search])

    respond_to do |format|
      format.html
      
      format.pdf do
        render pdf: "employees-#{Time.now}", 
        template: "employees/employees_pdf.html.erb", 
        layout: "pdf.html.erb"
      end
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee is updated successfully!"
    else
      render :new
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: "An employee is deleted successfully!"
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email, :phone_number)
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end
end
