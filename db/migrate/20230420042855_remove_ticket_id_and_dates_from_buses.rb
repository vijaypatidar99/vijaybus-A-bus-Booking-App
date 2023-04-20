class RemoveTicketIdAndDatesFromBuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :ticket_id
    remove_column :buses, :dates
  end
end
