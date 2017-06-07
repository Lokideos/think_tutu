class ChangePositionInRoutesColumnInRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :station_in_route_number, :position
  end
end
