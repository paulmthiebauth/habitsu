class CreateDailyHabitsTable < ActiveRecord::Migration
  def change
    create_table :daily_habits do |t|
      t.integer :user_id
      t.integer :habit_id
      t.integer :point_value
      t.datetime :completed_at
      t.datetime :date
    end
  end
end
