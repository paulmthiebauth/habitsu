class CreatePlanhabitTable < ActiveRecord::Migration
  def change
    create_table :planhabits do |t|
      t.integer :plan_id, null: false
      t.integer :habit_id, null: false
    end
  end
end
