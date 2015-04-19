class ChangeDailyHabitsTableName < ActiveRecord::Migration
   def up
   rename_table :daily_habits, :dailyhabits
   end
   def down
     rename_table :daily_habits, :dailyhabits
   end
end
