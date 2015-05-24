class AddAuthorIdToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :author_id, :integer
  end
end
