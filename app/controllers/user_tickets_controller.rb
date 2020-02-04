class UserTicketsController < ApplicationController

  def create
    if current_user.user_tickets.create(ticket_id: params[:ticket_id])
      redirect_to user_path(current_user), notice: t('user_ticket.create')
    else
      render :new
    end
  end
end