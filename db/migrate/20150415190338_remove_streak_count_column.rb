class RemoveStreakCountColumn < ActiveRecord::Migration
  def up
    remove_column :dailyhabits, :streak_count, :integer
  end

  def down
    add_column :dailyhabits, :streak_count, :integer
  end
end
