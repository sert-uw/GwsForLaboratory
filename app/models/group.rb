class Group < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :parent, class_name: "Group"

  has_many :children, class_name: "Group", dependent: :destroy
end
