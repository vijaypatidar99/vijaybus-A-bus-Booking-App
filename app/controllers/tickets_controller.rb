class TicketsController < ApplicationController
  def show
    @user = current_user
    @ticket = Ticket.where(user_id: current_user.id)
  end

  def new
    @bus = Bus.find_by(id: params[:bus_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
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

  def print
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = TicketPdf.new(@ticket)
        send_data pdf.render, filename: "ticket.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end


  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :price)
  end
end
