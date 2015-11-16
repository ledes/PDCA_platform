require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Smith"
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :course do
    title Faker::Name.title
    description Faker::Lorem.paragraph
    duration Faker::Number.number(2)
    price Faker::Number.number(2)
  end
end
