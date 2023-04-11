class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :bus_id
      t.integer :price

      t.timestamps
    end
  end
end
