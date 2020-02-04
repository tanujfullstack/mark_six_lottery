FactoryBot.define do
  factory :draw do
    title { Faker::Name.name }
    winner_user_ticket { FactoryBot.create(:user_ticket) }
    ticket
  end
end
