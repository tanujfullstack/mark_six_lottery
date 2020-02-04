FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: 8) }
  end
end
