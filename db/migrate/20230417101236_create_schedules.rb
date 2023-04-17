class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer :bus_id
      t.integer :route_id
      t.date :journey_date

      t.timestamps
    end
  end
end
