class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional: true
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, optional: true
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, optional: true

  validates :number, presence: true
  # validate :check_first_and_last_stations

  private

  def check_first_and_last_stations
    errors.add(:first_station, 'first station should not be equal to last station') if first_station_id == last_station_id
  end
end
