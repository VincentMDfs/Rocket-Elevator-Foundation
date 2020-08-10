class DimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :DimCustomers do |t|
      t.date :date_of_commisioning
      t.string :company_name
      t.string :full_name_company_contact
      t.string :email_company_contact
      t.integer :nb_elevator
      t.string :customer_city
  end
end
end