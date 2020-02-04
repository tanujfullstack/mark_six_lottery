class User < ApplicationRecord

  has_many :user_tickets
  has_many :tickets, -> { distinct }, through: :user_tickets

  has_many :draw_winnings, through: :user_tickets, source: :draw_winner
  has_many :draw_participants, through: :user_tickets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
