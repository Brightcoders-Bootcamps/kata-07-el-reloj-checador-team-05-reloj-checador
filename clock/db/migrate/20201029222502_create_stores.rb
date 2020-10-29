class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.text :name
      t.text :address
      t.text :phone
      t.time :open_time
      t.time :close_time
      t.integer :status

      t.timestamps
    end
  end
end
