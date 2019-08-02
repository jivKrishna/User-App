class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.search(params[:search])

    respond_to do |format|
      format.html
      
      format.pdf do
        pdf = EmployeesPdf.new(@employees)

        send_data pdf.render,
          filename: "Employees-#{Time.new.strftime("%d/%m/%Y-%H%M%S")}.pdf",
          type: "application/pdf", 
          isposition: "inline"
      end
    end
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      flash[:success] = "An employee is created successfully!"
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = "Employee is updated successfully!"
      redirect_to @employee
    else
      render :new
    end
  end

  def destroy
    if @employee.destroy
      flash[:success] = "An employee is deleted successfully!"
      redirect_to employees_path
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
