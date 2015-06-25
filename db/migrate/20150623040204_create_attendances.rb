class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.date :work_date
      t.string :in_time
      t.string :out_time
      t.string :project_name
      t.string :place
      t.text :description

      t.timestamps null: false
    end
    add_index :attendances, [:user_id, :work_date], unique: true
  end
end
