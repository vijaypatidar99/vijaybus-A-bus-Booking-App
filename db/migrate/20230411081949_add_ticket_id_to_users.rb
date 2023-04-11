class AddTicketIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ticket_id, :integer
  end
end
