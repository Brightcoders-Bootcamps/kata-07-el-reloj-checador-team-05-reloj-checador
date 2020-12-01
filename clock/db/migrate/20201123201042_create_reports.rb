# frozen_string_literal: true

# Create Reports Migration
class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.date :date
      t.time :hour_start
      t.time :hour_finish
      t.string :work_day

      t.timestamps
    end
  end
end
