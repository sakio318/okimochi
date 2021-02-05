FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.email }
    password{ 'password'}
    password_confirmation{'password'}
    introduction{ Faker::Lorem.characters(number:20) }
  end
end