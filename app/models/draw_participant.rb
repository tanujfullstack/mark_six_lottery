class DrawParticipant < ApplicationRecord
  belongs_to :user_ticket
  belongs_to :draw
end