class TicketsController < ApplicationController
  authorize_resource

  def index
    @bus = Bus.find(params[:bus_id])
    @tickets = @bus.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def all_bookings
    @tickets = Ticket.all.order("id DESC")
    #@buses = Bus.all.order("id DESC")
  end

  def new
    @bus = Bus.find_by(id: params[:bus_id])
    @schedule = Schedule.find_by(bus_id: @bus.id)
    if current_user
      @ticket = Ticket.new
    else
      flash[:notice] = "Please sign up or sign in to book a ticket"
      redirect_to new_user_session_path
    end
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
      flash[:alert] = "detaills updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:alert] = "Ticket deleted"
    redirect_to request.referrer
  end

  def approve_ticket
    @ticket = Ticket.find(params[:ticket_id])
    if @ticket.status != "Confirmed" && @ticket.update(status: :Confirmed)
      bus = Bus.find(@ticket.bus.id)
      bus.seats -= 1
      bus.save
      flash[:alert] = "Ticket has been approved."
      redirect_to request.referrer
      TicketMailer.send_email(@ticket).deliver_now
    else
      redirect_to request.referrer, notice: "Ticket already Confirmed"
    end
  end

  def reject_ticket
    @ticket = Ticket.find(params[:ticket_id])
    if @ticket.status != "Rejected" && @ticket.update(status: :Rejected)
      bus = @ticket.bus
      bus.seats += 1
      bus.save
      flash[:alert] = "Ticket rejected successfully"
      redirect_to request.referrer
      TicketMailer.send_email(@ticket).deliver_now
    else
      redirect_to request.referrer, notice: "Ticket already rejected"
    end
  end

  def cancel_ticket
    @ticket = Ticket.find(params[:ticket_id])
    if @ticket.status != "Cancelled"
      if request.post?
        cancel_reason = params[:cancel_reason]
        @ticket.update(status: "Cancelled", cancel_reason: cancel_reason)
        bus = @ticket.bus
        bus.seats += 1
        bus.save
        redirect_to my_tickets_path, notice: "Ticket was successfully cancelled."
        TicketMailer.send_email(@ticket).deliver_now
      else
        render "tickets/cancel_ticket_form"
      end
    else
      redirect_to request.referrer, notice: "Ticket already cancelled."
    end
  end

  def cancelled_tickets
    @cancelled_tickets = Ticket.where(status: "Cancelled")
  end

  def send_email
    @ticket = Ticket.find(params[:id])
    TicketMailer.send_email(@ticket).deliver_now
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :route_id, :price, :departure_time, :arrival_time, :date)
  end
end
