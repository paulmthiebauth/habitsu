  class PersonalHabitCompletion < ActiveRecord::Base
    belongs_to :user
    belongs_to :personal_habit
    validates :personal_habit, presence: true
    validates :user_id, presence: true
  end