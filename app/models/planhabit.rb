class Planhabit < ActiveRecord::Base
  belongs_to :habit
  belongs_to :plan
  validates :habit_id, presence: true
  validates :plan_id, presence: true
end
