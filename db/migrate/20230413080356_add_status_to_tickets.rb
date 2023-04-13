class AddStatusToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :status, :integer
  end
end
