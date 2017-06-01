class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  def stations_in_route
    stations = []
    RailwayStationsRoute.all.where(['railway_stations_routes.route_id = ?', id]).ordered.each do |association|
      RailwayStation.all.where(['railway_stations.id = ?', association.railway_station_id]).each do |station|
        stations << station
      end
    end
    stations
  end

  validates :name, presence: true
end