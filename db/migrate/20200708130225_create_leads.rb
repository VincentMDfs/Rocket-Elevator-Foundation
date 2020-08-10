class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :project_name
      t.text :project_description
      t.string :department_in_charge
      t.text :message
      t.binary :attached_file, :limit => 10.megabyte
      t.string :file_name
      t.timestamps
    end
  end
end
