class UsersController < ApplicationController
  def show
    @user = current_user
    @ticket = Ticket.where(user_id: current_user.id)
  end

end
