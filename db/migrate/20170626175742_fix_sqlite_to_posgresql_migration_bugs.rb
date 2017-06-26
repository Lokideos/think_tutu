class FixSqliteToPosgresqlMigrationBugs < ActiveRecord::Migration[5.0]
  def change
    remove_column :railway_stations_routes, :station_in_route_number, :integer
    add_column :railway_stations_routes, :position, :integer
    add_column :railway_stations_routes, :arrival_time, :datetime
    add_column :railway_stations_routes, :departure_time, :datetime

    add_column :tickets, :fio, :string
    add_column :tickets, :passport_data, :string

    remove_column :trains, :sort_type, :string
    add_column :trains, :sort_type, :boolean, default: false, null: false
  end
end
