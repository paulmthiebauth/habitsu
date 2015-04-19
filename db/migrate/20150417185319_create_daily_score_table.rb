class CreateDailyScoreTable < ActiveRecord::Migration
  def change
    create_table :dailyscores do |t|
      t.integer :user_id
      t.datetime :date
      t.string :weekday
      t.integer :total_score
    end
  end
end
