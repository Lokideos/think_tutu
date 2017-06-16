class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  def self.available_routes(arrival_station_id, departure_station_id)
    Route.joins(:railway_stations_routes).where(railway_stations_routes: { railway_station_id: arrival_station_id }) &
    Route.joins(:railway_stations_routes).where(railway_stations_routes: { railway_station_id: departure_station_id })
  end
end
