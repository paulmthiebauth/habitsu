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

end
