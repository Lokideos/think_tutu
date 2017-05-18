class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :station_in_route_id, uniqueness: { scope: :route_id }

  scope :ordered, -> { order(:station_in_route_id) }
end
