class AddPersonalHabitIdToPersonalHabitCompletion < ActiveRecord::Migration
  def change
    add_column :personal_habit_completions, :personal_habit_id, :integer
  end
end
