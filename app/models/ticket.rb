class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: "RailwayStation", foreign_key: :first_station_id
  belongs_to :last_station, class_name: "RailwayStation", foreign_key: :last_station_id
  # has_many :railway_stations_tickets
  # has_many :railway_stations, through: :railway_stations_tickets

  validates :number, presence: true
  validate :check_first_and_last_stations

  def check_first_and_last_stations
    errors.add(:first_station, "first station should not be equal to last station") if self.first_station_id == self.last_station_id
  end
end
