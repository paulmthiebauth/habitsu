class UpdateScoreToFloat < ActiveRecord::Migration
  def up
    change_column :dailyhabits, :point_value, :float
  end

  def down
    change_column :dailyhabits, :point_value, :integer
  end

end
