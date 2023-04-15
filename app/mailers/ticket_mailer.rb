class TicketMailer < ApplicationMailer
  def send_email(ticket)
    @ticket = ticket
    @email = @ticket.user.email
    mail(to: @email, subject: "Your Ticket Information")
  end
end
