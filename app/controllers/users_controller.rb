class UsersController < ApplicationController

  def show
    @draw_participants = current_user.draw_participants.page params[:page] #scope and pagination
  end

end
