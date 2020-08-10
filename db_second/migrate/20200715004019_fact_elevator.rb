class FactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :FactElevator do |t|
      t.integer :serial_number
      t.date :date_of_commisioning
      t.integer :building_id
      t.integer :customer_id
      t.string :building_city
  end
end
end