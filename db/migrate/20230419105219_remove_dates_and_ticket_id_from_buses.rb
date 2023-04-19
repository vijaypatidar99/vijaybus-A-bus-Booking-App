class RemoveDatesAndTicketIdFromBuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :dates
    remove_column :buses, :ticket_id
    remove_column :buses, :route_id
  end
end
