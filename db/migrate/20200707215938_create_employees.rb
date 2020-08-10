class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :user, foreign_key: true
      t.string :email,              null: false, default:""
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :password, null: false, default:""
      t.string :password_confirmation, null: false, default:""

      t.timestamps
    end
    add_index :employees, :email,           unique:true
  end
end
