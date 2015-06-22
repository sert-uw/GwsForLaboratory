class AddNameToTimetableItems < ActiveRecord::Migration
  def change
    add_column :timetable_items, :name, :string
  end
end
