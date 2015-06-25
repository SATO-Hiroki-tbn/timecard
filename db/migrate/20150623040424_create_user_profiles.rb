class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string  :employee_no
      t.string :lastname
      t.string :firstname
      t.string :in_regular, default: '09:00'
      t.string :out_regular, default: '18:00'

      t.timestamps null: false
    end

  add_index :user_id, unique:true
  end
end
