class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :station_in_route_number, uniqueness: { scope: :route_id }

  before_save :set_position_in_route

  scope :ordered, -> { order(:station_in_route_number) }

  def set_position_in_route
    self.station_in_route_number = route.railway_stations_routes.maximum(:station_in_route_number).to_i + 1
  end
end
