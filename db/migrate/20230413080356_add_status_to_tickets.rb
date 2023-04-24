class AddStatusToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :status, :integer
    add_column :tickets, :date, :date
    add_column :tickets, :cancel_reason, :string, default: nil
    add_column :tickets, :arrival_time, :datetime
    add_column :tickets, :departure_time, :datetime
  end
end
