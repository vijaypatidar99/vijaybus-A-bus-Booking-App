class AddNameAndNumberToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :name, :string
    add_column :buses, :number, :string
  end
end
