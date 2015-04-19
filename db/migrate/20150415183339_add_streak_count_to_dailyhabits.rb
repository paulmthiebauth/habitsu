class AddStreakCountToDailyhabits < ActiveRecord::Migration
  def change
    remove_column :dailyhabits, :streak_count, :integer
  end
end
