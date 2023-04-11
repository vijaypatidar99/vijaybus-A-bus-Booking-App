class AddTicketIdToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :ticket_id, :integer
  end
end
