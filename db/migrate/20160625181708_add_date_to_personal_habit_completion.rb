class AddDateToPersonalHabitCompletion < ActiveRecord::Migration
  def change
    add_column :personal_habit_completions, :date, :datetime
  end
end
