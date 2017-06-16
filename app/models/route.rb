class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  def self.with_stations(arrival_station_id, departure_station_id)
    Route.joins(:railway_stations_routes).includes(:trains).where(railway_stations_routes: { railway_station_id: arrival_station_id }) &
    Route.joins(:railway_stations_routes).includes(:trains).where(railway_stations_routes: { railway_station_id: departure_station_id })
  end
end
