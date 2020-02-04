class PlayDraw < ApplicationJob

  def perform
    unplayed_draw = Draw.where(winner_user_ticket_id: nil).first
    return unless unplayed_draw

    last_draw_completed_at = DrawParticipant.last&.created_at

    user_tickets = if last_draw_completed_at
                     UserTicket.where(created_at: last_draw_completed_at..Time.zone.now)
                   else
                     UserTicket.all
                   end

    return if user_tickets.blank?

    user_tickets.each do |user_ticket|
      DrawParticipant.create(draw_id: unplayed_draw.id, user_ticket_id: user_ticket.id)
    end

    #calculate winner
    winner_user_ticket_id = unplayed_draw.draw_participants.collect{|dp| dp.user_ticket.id}.sample
    unplayed_draw.update(winner_user_ticket_id: winner_user_ticket_id)
  end
end