class RemoveCompletedPointsFromHabits < ActiveRecord::Migration
  def up
    remove_column :habits, :point_value, :integer
    remove_column :habits, :completed, :string
  end

  def down
    add_column :habits, :point_value, :integer
    add_column :habits, :completed, :string
  end
end
