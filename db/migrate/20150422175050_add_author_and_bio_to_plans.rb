class AddAuthorAndBioToPlans < ActiveRecord::Migration
  def change
      add_column :plans, :author, :string
      add_column :plans, :author_info, :string
  end
end
