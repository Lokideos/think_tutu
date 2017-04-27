class RailwayStation < ApplicationRecord
  has_many :trains
  # has_many :tickets
  has_and_belongs_to_many :tickets
  # has_many :railway_stations_tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  # has_many :tickets, through: :railway_stations_tickets

  validates :title, presence: true
end
