class RenameDailyscores < ActiveRecord::Migration
  def change
    rename_table :dailyscores, :daily_scores
  end
end
