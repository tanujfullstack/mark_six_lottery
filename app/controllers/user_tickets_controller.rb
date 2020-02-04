class UserTicketsController < ApplicationController

  def create
    if current_user.user_tickets.create(ticket_id: params[:ticket_id])
      redirect_to users_path(current_user), notice: 'UserTicket was successfully created.'
    else
      render :new
    end
  end
end