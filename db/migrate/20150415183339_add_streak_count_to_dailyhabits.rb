class AddStreakCountToDailyhabits < ActiveRecord::Migration
  def up
    add_column :dailyhabits, :streak_count, :integer
  end

  def down
    remove_column :dailyhabits, :streak_count, :integer
  end
end
