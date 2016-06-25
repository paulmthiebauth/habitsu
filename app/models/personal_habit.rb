class PersonalHabit < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :habit_name, presence: true

  validates :user_id, uniqueness: {
  scope: :habit_name, message: "No duplicate habits allowed!"
  }
end
