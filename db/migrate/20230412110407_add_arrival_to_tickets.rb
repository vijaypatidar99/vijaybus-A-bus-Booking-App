class AddArrivalToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :arrival_time, :datetime
    add_column :tickets, :departure_time, :datetime
  end
end
