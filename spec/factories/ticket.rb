FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    winning_amount { Faker::Number.number(digits: 2) }
  end
end
