class CreateSignupTable < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.integer :user_id, null: false
      t.integer :plan_id, null: false
    end
  end
end
