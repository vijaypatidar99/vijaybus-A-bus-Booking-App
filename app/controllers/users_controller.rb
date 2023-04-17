class UsersController < ApplicationController
  def my_tickets
    authorize! :read, :my_tickets
  end
end
