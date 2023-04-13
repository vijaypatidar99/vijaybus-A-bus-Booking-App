class TicketsController < ApplicationController
  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome(self).deliver_now  
end

  def show
    @user = current_user
    @ticket = Ticket.where(user_id: current_user.id)
  end

  def index
    @ticket = Ticket.find(params[:id])
  end

  def new
    @bus = Bus.find_by(id: params[:bus_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
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

  def send_index
    @tickets = Ticket.all
    tickets_html = render_to_string(template: "tickets/index.html.erb", layout: "mailer")
    TicketMailer.send_ticket_index(current_user.email, tickets_html).deliver_now
    redirect_to tickets_path, notice: "Index sent!"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :age, :sex, :bus_id, :price, :departure_time, :arrival_time)
  end
end
