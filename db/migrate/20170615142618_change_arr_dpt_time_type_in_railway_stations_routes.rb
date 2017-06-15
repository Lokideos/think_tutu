class ChangeArrDptTimeTypeInRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    change_column :railway_stations_routes, :arrival_time, :datetime
    change_column :railway_stations_routes, :departure_time, :datetime
  end
end
