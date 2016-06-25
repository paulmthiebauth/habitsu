class CreatePersonalHabit < ActiveRecord::Migration
  def change
    create_table :personal_habits do |t|
      t.integer :user_id, null: false
      t.string :habit_name
      t.string :frequency
      t.timestamps
    end
  end
end
