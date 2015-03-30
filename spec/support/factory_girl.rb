require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username 'factorrrrygirlllll'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
  end

  factory :question do
    sequence(:title) { |n| "Best Question #{n}" }
    body "Man this is the best question ever bro my goodness how did you ask it so good bruhhhhhhhhhhhhhhhhhhhhhhdjfsdlkfjlkasjdflkasjdflkajsdlkfjaslkdfjaslkdfjlaskdjflkasdjflkasjdflkasjdlfkajsdlfkjaslkdf"
  end
  
end
