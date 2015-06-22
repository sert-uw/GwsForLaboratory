class GroupTimetablesController < ApplicationController
  before_action :init_timetable, only: [:index]

  def index
    @group = Group.find(params[:group_id])
    @group.users.each do |user|
      if user.timetable.present?
        user.timetable.get_ordered_items.each_with_index do |user_item, y|
          user_item.get_array.each_with_index do |flag, x|
            @timetable[y][x] = @timetable[y][x] || flag
          end
        end
      end
    end
  end

  private

    def init_timetable
      @timetable = []
      5.times do
        @timetable << [false, false, false, false, false]
      end
    end
end
