class ChangeStationInRouteColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :station_in_route_id, :station_in_route_number
  end
end
