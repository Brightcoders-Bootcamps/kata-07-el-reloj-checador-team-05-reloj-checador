# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_123_201_042) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'employees', force: :cascade do |t|
    t.text 'name'
    t.text 'email'
    t.integer 'nip'
    t.text 'position'
    t.text 'address'
    t.text 'phone'
    t.boolean 'status'
    t.json 'work_days'
    t.time 'enter_time'
    t.time 'departure_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reports', force: :cascade do |t|
    t.bigint 'employee_id', null: false
    t.date 'date'
    t.time 'hour_start'
    t.time 'hour_finish'
    t.string 'work_day'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['employee_id'], name: 'index_reports_on_employee_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.text 'name'
    t.text 'address'
    t.text 'phone'
    t.time 'open_time'
    t.time 'close_time'
    t.boolean 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', null: false
    t.string 'encrypted_password', limit: 128, null: false
    t.string 'confirmation_token', limit: 128
    t.string 'remember_token', limit: 128, null: false
    t.index ['email'], name: 'index_users_on_email'
    t.index ['remember_token'], name: 'index_users_on_remember_token'
  end

  add_foreign_key 'reports', 'employees'
end
