class RailwayStation < ApplicationRecord
  has_many :trains
  
  has_many :first_station_tickets, class_name: "Ticket", foreign_key :first_station_ticket_id
  has_many :last_station_tickets, class_name: "Ticket", foreign_key :last_station_ticket_id
  
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  
  validates :title, presence: true
end
