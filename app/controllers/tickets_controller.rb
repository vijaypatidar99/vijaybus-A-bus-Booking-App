class TicketsController < ApplicationController
  def show
    @ticket = Ticket.all
  end
def new
  @bus = Bus.find_by(id: params[:bus_id])
  @ticket = Ticket.new
end
  # def edit
  #   @bus = Bus.find_by(id: params[:bus_id])
  #   @ticket = Ticket.new(bus_id: @bus.id)
  # end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      flash[:success] = "ticket save Successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:success] = "detaills updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :price)
  end
end
