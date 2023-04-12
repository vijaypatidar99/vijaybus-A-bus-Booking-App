class TicketPdf < Prawn::Document
    def initialize(ticket)
      super()
      @ticket = ticket
      ticket_details
    end
    
    def ticket_details
      text "Ticket Details", size: 20, style: :bold, align: :center
      move_down 20
      table([
        ["Ticket ID", @ticket.id],
        ["Passenger Name", @ticket.name],
        ["Passenger Age", @ticket.age],
        ["Passenger Sex", @ticket.sex],
        ["Bus fare", @ticket.price],
        ["Pickup Point", @ticket.bus.pickup],
        ["Drop Point", @ticket.bus.drop]
      ])
    end
  end
  