class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :full_name
      t.string :email
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true
      t.string :phone
      t.text :company_description
      t.string :tech_authority_full_name
      t.string :tech_authority_email
      t.string :tech_authority_phone

      t.timestamps
    end
  end
end
