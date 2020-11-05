class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.text :name
      t.text :email
      t.integer :nip
      t.text :position
      t.text :address
      t.text :phone
      t.boolean :status
      t.json :work_days
      t.time :enter_time
      t.time :departure_time

      t.timestamps
    end
  end
end
