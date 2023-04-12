class AddArrivalTimeToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :arrival_time, :datetime
  end
end
