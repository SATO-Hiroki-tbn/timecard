class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.text :description

      t.timestamps null: false
    end
  end
end
