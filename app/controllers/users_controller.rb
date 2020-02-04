class UsersController < ApplicationController

  def show
    @draw_participants = current_user.draw_participants #scope and pagination
  end

end