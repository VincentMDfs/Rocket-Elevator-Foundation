class FactContact < ActiveRecord::Migration[5.2]
  def change
    create_table :FactContact do |t|
      t.integer :contact_id
      t.date :creation
      t.string :company_name
      t.string :email
      t.string :project_name
    end
  end
end
