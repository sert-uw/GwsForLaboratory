class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  belongs_to :timetable

  has_and_belongs_to_many :groups

  def administrator?
    groups.find_by(category: 'administrator').present?
  end
end
