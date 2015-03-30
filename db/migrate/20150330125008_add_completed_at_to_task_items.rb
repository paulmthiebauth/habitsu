class AddCompletedAtToTaskItems < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_at, :datetime
  end
end
