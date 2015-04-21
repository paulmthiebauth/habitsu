require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Jack'
    last_name 'Jones'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
  end

  factory :task do
    user
    name 'Go to meeting with spencer'
  end

  factory :plan do
    plan_name 'Daily success plan'
  end

  factory :habit do
    name 'Rise at 7 AM'
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :dailyhabit do
    user_id user
    habit_id habit
    point_value 0
    completed_at nil
    date DateTime.now
    plan_id plan
  end
end
