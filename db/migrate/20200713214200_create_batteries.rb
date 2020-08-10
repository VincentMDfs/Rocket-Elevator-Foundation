class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building
      t.string :type_of_battery
      t.string :status
      t.references :employee, foreign_key: true
      t.date :date_of_comissioning
      t.date :date_of_last_inspection
      t.text :certificate_of_operation
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
