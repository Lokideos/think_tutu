class RemoveColumnsFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :chosen_train
    remove_column :tickets, :arrival_time
    remove_column :tickets, :departure_time
  end
end
