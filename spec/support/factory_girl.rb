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

  factory :lesson do
    title Faker::Name.title
    priority Faker::Number.number(1)
  end

  factory :quiz do
    question Faker::Name.title
    right_answer "response_A"
    response_A Faker::Number.number(199)
    response_B Faker::Number.number(199)
    response_C Faker::Number.number(199)
    response_D Faker::Number.number(199)
  end
end
