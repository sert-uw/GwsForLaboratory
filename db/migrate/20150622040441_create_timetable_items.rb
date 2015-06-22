class CreateTimetableItems < ActiveRecord::Migration
  def change
    create_table :timetable_items do |t|
      t.integer :timetable_id
      t.boolean :first
      t.boolean :second
      t.boolean :third
      t.boolean :fourth
      t.boolean :fifth

      t.timestamps null: false
    end
  end
end
