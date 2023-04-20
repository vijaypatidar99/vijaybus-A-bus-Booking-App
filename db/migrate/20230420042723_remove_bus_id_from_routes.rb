class RemoveBusIdFromRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :routes, :bus_id
    remove_column :routes, :first_bus
    remove_column :routes, :last_bus

  end
end
