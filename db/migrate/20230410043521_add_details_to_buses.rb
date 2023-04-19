class AddDetailsToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :price, :integer
  end
end
