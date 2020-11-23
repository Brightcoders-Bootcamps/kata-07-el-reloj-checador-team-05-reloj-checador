class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.date :date, default: Date.today
      t.time :hour_start, default: Time.now
      t.time :hour_finish, default: Time.now
      t.string :work_day, default: Date.today.strftime("%A")

      t.timestamps
    end
  end
end
