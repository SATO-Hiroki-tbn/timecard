class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams do |t|
      t.integer :user_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
