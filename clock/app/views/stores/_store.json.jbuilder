# frozen_string_literal: true

json.extract! store, :id, :name, :address, :phone, :open_time, :close_time, :status, :created_at, :updated_at
json.url store_url(store, format: :json)
