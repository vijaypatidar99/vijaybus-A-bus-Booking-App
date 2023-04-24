class AddNameAndNumberToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :name, :string
    add_column :buses, :number, :string
    add_column :buses, :price, :integer
    add_column :buses, :seats, :integer
  end
end
