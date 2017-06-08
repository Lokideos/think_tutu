class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains  

  validates :name, presence: true

  def self.available_routes(arrival_station_id, departure_station_id)
    chosen_routes = []
    Route.all.each do |route|
      if route.stations_in_route?(arrival_station_id, departure_station_id)
        chosen_routes << route 
      end
    end  
    chosen_routes
  end

  def stations_in_route?(arrival_station_id, departure_station_id)    
    in_route = false
    arrival_station_in_route = false
    departure_station_in_route = false
    self.railway_stations.each do |station|
      arrival_station_in_route = true if station.id == arrival_station_id.to_i
      departure_station_in_route = true if station.id == departure_station_id.to_i
    end
    arrival_station_in_route && departure_station_in_route   
  end
end