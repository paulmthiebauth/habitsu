class CreateTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :completed
      t.timestamps
    end
  end
end
