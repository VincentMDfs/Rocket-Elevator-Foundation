class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone_number
      t.string :type_of_building
      t.integer :number_of_appartments
      t.integer :number_of_floors
      t.integer :number_of_basements
      t.integer :number_of_stores
      t.integer :number_of_cages
      t.integer :number_of_parking_spots
      t.integer :number_of_companies
      t.integer :occupants_per_floor
      t.integer :open_hours
      t.integer :estimate_number_of_cages
      t.string :range_of_elevator
      t.string :unit_price
      t.string :elevator_price
      t.string :installation_fees
      t.string :total_price

      t.timestamps
    end
  end
end
