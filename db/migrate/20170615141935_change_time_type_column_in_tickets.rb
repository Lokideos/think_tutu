class ChangeTimeTypeColumnInTickets < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :arrival_time, :datetime
    change_column :tickets, :departure_time, :datetime
  end
end
