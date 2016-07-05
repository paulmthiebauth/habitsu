class CreatePersonalHabitCompletion < ActiveRecord::Migration
  def change
    create_table :personal_habit_completions do |t|
      t.integer :user_id, null: false
      t.string :habit_name, null: false
      t.datetime :completed_at
    end
  end
end
