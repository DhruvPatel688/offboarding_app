class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @employees = current_user.employees
  end

  def show; end
  def new
    @employee = Employee.new
  end
  def edit; end

  def create
    @employee = current_user.employees.build(employee_params)

    if @employee.save
      redirect_to @employee, notice: "Employee was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy!
    redirect_to employees_path, status: :see_other, notice: "Employee was successfully destroyed."
  end

  private

  def set_employee
    @employee = current_user.employees.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to employees_path, alert: "Employee not found or not authorized"
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :department, :position)
  end
end
