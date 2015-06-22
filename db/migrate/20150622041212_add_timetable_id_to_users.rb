class AddTimetableIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timetable_id, :integer
  end
end
