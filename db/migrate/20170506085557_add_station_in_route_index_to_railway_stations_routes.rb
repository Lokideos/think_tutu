class AddStationInRouteIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :station_in_route_index, :integer
  end
end
