# frozen_string_literal: true

# ReportsController
class ReportsController < ApplicationController
  before_action :require_login, except: %i[new create edit update]
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @result = verify_faults
  end

  # GET /reports/new
  def new
    @employee = Employee.find_by(nip: params['employee']&.[]('nip'))
    @pending_report = @employee.reports.find_by(hour_finish: nil) if @employee.present?

    redirect_to edit_report_path(@pending_report) if @pending_report.present?

    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    @employee = @report.employee
  end

  # POST /reports
  # POST /reports.json
  def create
    employee = Employee.find(report_params[:employee_id])
    @report = Report.new(employee: employee, date: Date.today, hour_start: Time.now, hour_finish: nil, work_day: Date.today.strftime('%A'))

    respond_to do |format|
      if @report.save
        format.html { redirect_to new_report_url, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(hour_finish: Time.now)
        format.html { redirect_to new_report_url, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def verify_faults
    report = Report.find(@report.id)
    employee = Employee.find(report.employee_id)
    employee.work_days
    days_month_working = employee.work_days * obtain_number_week
    count_day = 0
    report = Report.where(employee_id: employee.id)
    employee.work_days.each do |day|
      count_day += report.where(work_day: day).count
    end
    if count_day < days_month_working.count
      days_month_working.count - count_day
    else
      0
    end
  end

  def obtain_number_week
    current_time = Time.zone.now
    beginning_of_the_month = current_time.beginning_of_month
    current_time.strftime('%U').to_i - beginning_of_the_month.strftime('%U').to_i + 1
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:employee_id, :date, :hour_start, :hour_finish, :work_day)
  end

  def employee_params
    params.require(:employee).permit(:nip)
  end
end
