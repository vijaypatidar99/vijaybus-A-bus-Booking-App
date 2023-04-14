class AddDateToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :date, :date
  end
end
