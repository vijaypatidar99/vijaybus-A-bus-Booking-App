class AddDatesToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :dates, :text
  end
end
