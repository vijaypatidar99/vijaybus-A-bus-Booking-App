class AddDetailsToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :bus_id, :integer
  end
end
