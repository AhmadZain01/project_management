class Managers::EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy, :show]
  def index
    @employees = Employee.all
  end


  

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
   
    respond_to do |format|
      if @employee.save
        format.html { redirect_to managers_employee_path(@employee), notice: 'Employee Added Successfully ' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def Show

  end


  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :dob, :country, :city, :address)
  end
end
