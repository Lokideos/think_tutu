class RailwayStation < ApplicationRecord
  has_many :trains, class_name: 'Train', foreign_key: :current_station_id

  has_many :first_station_tickets, class_name: 'Ticket', foreign_key: :first_station_ticket_id
  has_many :last_station_tickets, class_name: 'Ticket', foreign_key: :last_station_ticket_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_travel_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time) if station_route
    station_route.update(departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_at(route)
    station_route(route).try(:arrival_time)
  end

  def departure_at(route)
    station_route(route).try(:departure_time)
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
