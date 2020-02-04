class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  has_one :draw_winner, foreign_key: 'winner_user_ticket_id', class_name: 'Draw'
  has_many :draw_participants

  def is_draw_winner?(draw)
    return unless draw.is_a? Draw
    draw_winner == draw
  end
end