class PlayDraw < ApplicationJob

  def perform
    unplayed_draw = Draw.where(winner_user_ticket_id: nil).first
    return unless unplayed_draw

    user_tickets = UserTicket.where(created_at: DrawParticipant.last.created_at..Time.zone.now)
    user_tickets.each do |user_ticket|
      DrawParticipant.create(draw_id: unplayed_draw.id, user_ticket_id: user_ticket.id)
    end

    #calculate winner
    winner_user_ticket_id = unplayed_draw.draw_participants.collect{|dp| dp.user_ticket.id}.sample
    unplayed_draw.update(winner_user_ticket_id: winner_user_ticket_id)
  end
end