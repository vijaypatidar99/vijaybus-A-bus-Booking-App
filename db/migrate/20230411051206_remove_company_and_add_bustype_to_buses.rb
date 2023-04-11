class RemoveCompanyAndAddBustypeToBuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :company
    add_column :buses, :bustype, :string
    add_column :buses, :pickup, :string
    add_column :buses, :drop, :string
  end
end
