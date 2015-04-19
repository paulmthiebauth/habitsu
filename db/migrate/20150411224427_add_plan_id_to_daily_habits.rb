class AddPlanIdToDailyHabits < ActiveRecord::Migration
  def change
    add_column :dailyhabits, :plan_id, :integer
  end
end
