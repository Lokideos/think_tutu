class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  validates :name, :number, presence: true
end
