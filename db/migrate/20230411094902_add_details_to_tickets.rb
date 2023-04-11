class AddDetailsToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :age, :integer
    add_column :tickets, :sex, :string
  end
end
