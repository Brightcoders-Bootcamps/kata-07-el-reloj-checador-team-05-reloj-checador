class EmployeesController < ApplicationController
  before_action :require_login
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.where(status: true) # Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
    @show_btn_employee = true
  end
  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(format_work_days(employee_params))

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(format_work_days(employee_params))
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    if @employee.status
      @employee.update(status: false)
      flash[:notice] = "Successfully disabled #{@employee.name}."
      flash[:notice] = "Failed to disable #{@employee.name}."
      render :action => :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :nip, :email, :address, :phone, :position, :status, :enter_time, :departure_time, work_days: {})
    end

    def format_work_days(parameters)
      parameters[:work_days] = parameters[:work_days].keys || []
      parameters
    end
end
