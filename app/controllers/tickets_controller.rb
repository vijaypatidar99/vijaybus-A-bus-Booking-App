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
    @ticket.status = :Pending
    if @ticket.save
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

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:success] = "Ticket deleted"
    redirect_to request.referrer
  end

  def approve_ticket
    authorize! :approve_ticket, @ticket
    @ticket = Ticket.find(params[:ticket_id])
    if @ticket.update(status: :Confirmed)
      bus = Bus.find(@ticket.bus.id)
      bus.seats -= 1
      bus.save
      flash[:success] = "Ticket has been approved."
      redirect_to request.referrer
    else
      flash[:error] = "There was an error in approving the ticket."
      render :show
    end
  end

  def reject_ticket
    # authorize! :reject_ticket, @ticket
    @ticket = Ticket.find(params[:ticket_id])
    if @ticket.update(status: :Rejected)
      bus = @ticket.bus
      bus.seats += 1
      bus.save
      flash[:success] = "Ticket rejected successfully"
      redirect_to request.referrer
    else
      flash[:error] = "Failed to reject ticket"
      redirect_to request.referrer
    end
  end

  def cancel_ticket
    # authorize! :cancel_ticket, @ticket
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.update(status: "Cancelled")
    bus = @ticket.bus
    bus.seats += 1
    bus.save
    redirect_to request.referrer, notice: "Ticket was successfully cancelled."
  end

  def cancelled_tickets
    @cancelled_tickets = Ticket.where(status: "Cancelled")
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :price, :departure_time, :arrival_time, :date)
  end
end
