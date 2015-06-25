class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps null: false
    end

    add_index :users_roles, [:user_id, :role_id], unique: true
  end
end
