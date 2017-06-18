class AddArrivalAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    change_table :railway_stations_routes do |t|
      t.integer :arrival_time
      t.integer :departure_time
    end
  end
end
