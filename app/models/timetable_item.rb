class TimetableItem < ActiveRecord::Base
  belongs_to :timetable

  def get_array
    [first, second, third, fourth, fifth]
  end
end
