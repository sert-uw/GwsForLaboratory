class CreateTimetableItems < ActiveRecord::Migration
  def change
    create_table :timetable_items do |t|
      t.integer :timetable_id
      t.boolean :first, default: false
      t.boolean :second, default: false
      t.boolean :third, default: false
      t.boolean :fourth, default: false
      t.boolean :fifth, default: false

      t.timestamps null: false
    end
  end
end
