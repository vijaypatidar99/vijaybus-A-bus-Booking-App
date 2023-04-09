class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :number
      t.string :company
      t.integer :seats

      t.timestamps
    end
  end
end
