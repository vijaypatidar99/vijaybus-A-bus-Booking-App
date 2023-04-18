class AddRouteIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :route_id, :integer
  end
end
