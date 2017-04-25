class RailwayStationsTicket < ApplicationRecord
  belongs_to :railway_station
  belongs_to :ticket
end