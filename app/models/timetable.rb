class Timetable < ActiveRecord::Base
  before_create :create_items

  belongs_to :user

  has_many :items, class_name: "TimetableItem", dependent: :destroy

  def get_ordered_items
    items.order :name
  end

  private

    def create_items
      ['1', '2', '3', '4', '5'].each do |day|
        items << TimetableItem.create(timetable_id: id, name: day)
      end
    end
end
