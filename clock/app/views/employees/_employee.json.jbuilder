json.extract! employee, :id, :name, :nip, :address, :status, :work_days, :enter_time, :departure_time, :created_at, :updated_at
json.url employee_url(employee, format: :json)
