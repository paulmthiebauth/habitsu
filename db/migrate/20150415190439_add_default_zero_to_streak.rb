class AddDefaultZeroToStreak < ActiveRecord::Migration
  def up
    add_column :dailyhabits, :streak_count, :integer, default: 0
  end

  def down
    remove_column :dailyhabits, :streak_count, :integer
  end
end
