class AddStationsIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :first_station_id, :integer
    add_column :tickets, :last_station_id, :integer
  end
end
