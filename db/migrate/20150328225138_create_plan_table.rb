class CreatePlanTable < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_name
    end
  end
end
