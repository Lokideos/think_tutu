class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :station_in_route_id, uniqueness: { scope: :route_id }

  before_save :set_position_in_route

  scope :ordered, -> { order(:station_in_route_id) }

  def set_position_in_route
    if RailwayStationsRoute.all.where(["railway_stations_routes.route_id = ?", self.route_id]).ordered.last.nil?
      self.station_in_route_id = 1
    else
      self.station_in_route_id = RailwayStationsRoute.all.where(["railway_stations_routes.route_id = ?", self.route_id]).ordered.last.station_in_route_id + 1
    end
  end
end
