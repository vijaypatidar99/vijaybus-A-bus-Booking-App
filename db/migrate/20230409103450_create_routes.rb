class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :from
      t.string :to
    

      t.timestamps
    end
  end
end
