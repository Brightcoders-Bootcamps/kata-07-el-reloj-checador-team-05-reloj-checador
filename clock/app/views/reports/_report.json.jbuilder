json.extract! report, :id, :employee_id, :date, :hour_start, :hour_finish, :work_day, :created_at, :updated_at
json.url report_url(report, format: :json)
