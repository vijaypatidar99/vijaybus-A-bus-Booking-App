class AddCancelReasonToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :cancel_reason, :string, default: nil
  end
end
