class Draw < ApplicationRecord
  belongs_to :ticket
  belongs_to :winner_user_ticket, class_name: 'UserTicket', optional: true
  has_many :draw_participants
end