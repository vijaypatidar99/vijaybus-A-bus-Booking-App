class RemovedateFromSchedules < ActiveRecord::Migration[7.0]
  def change
     remove_column :schedules, :journey_date
     add_column :schedules, :dates, :string, array: true, default: [].to_yaml
  end
end
