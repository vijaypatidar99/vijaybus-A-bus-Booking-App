class TicketsController < ApplicationController
  def index
    @bus = Bus.find(params[:bus_id])
    @tickets = @bus.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @bus = Bus.find_by(id: params[:bus_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.status = :pending
    if @ticket.save
      bus = Bus.find(@ticket.bus.id)
      bus.seats -= 1
      bus.save
      flash.now[:success] = "ticket save Successfully"
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

  def approve_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.update(status: :confirmed)
      flash[:success] = "Ticket has been approved."
      redirect_to request.referrer
    else
      flash[:error] = "There was an error in approving the ticket."
      render :show
    end
  end

  def reject_ticket
    @ticket = Ticket.find(params[:id])
    if @ticket.update(status: :rejected)
      bus = @ticket.bus
      bus.seats += 1
      bus.save
      flash[:success] = "Ticket rejected successfully"
    else
      flash[:error] = "Failed to reject ticket"
    end
    redirect_to request.referrer
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :price, :departure_time, :arrival_time)
  end
end
