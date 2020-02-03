class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  has_one :draw_winner, foreign_key: 'winner_user_ticket_id', class_name: 'Draw'
end