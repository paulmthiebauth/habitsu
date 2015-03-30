class CreateHabitTable < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name, null: false
      t.string :completed, null: false
      t.integer :point_value
      t.timestamps
    end
  end
end
