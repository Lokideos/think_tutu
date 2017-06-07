class RailwayStation < ApplicationRecord
  has_many :trains

  has_many :first_station_tickets, class_name: 'Ticket', foreign_key: :first_station_ticket_id
  has_many :last_station_tickets, class_name: 'Ticket', foreign_key: :last_station_ticket_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)    
    station_route(route).try(:position)
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
