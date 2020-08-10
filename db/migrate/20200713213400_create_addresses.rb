class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :type_of_address
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.string :appartment_or_suite
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :notes
      t.float :longitude, :precision => 10, :scale => 6
      t.float :latitude, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
