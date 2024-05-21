FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    room_number { Faker::Number.number(digits: 4) }
  end
end
