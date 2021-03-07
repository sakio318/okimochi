FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number:5) }
    shop_name { Faker::Lorem.characters(number:5) }
    packing{ [true, false]}
    introduction{ Faker::Lorem.characters(number:20) }
    user_id{ :user }
    genre_id{ :genre }
    situation_ids { 1 }
  end
end