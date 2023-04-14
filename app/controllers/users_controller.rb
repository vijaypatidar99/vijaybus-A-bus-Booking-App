class UsersController < ApplicationController
  def my_tickets
    authorize! :read, :my_tickets
    @user = current_user
    @ticket = Ticket.where(user_id: current_user.id)
  end
end
