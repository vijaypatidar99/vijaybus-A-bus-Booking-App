class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :from
      t.string :to
      t.string :first_bus
      t.string :last_bus

      t.timestamps
    end
  end
end
