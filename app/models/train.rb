class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  def cars_quantity_by_type(chosen_type)
    cars.where(type: chosen_type).size
  end
  
  def seats_by_car_and_seat_types(chosen_car_type, seat_type)
    cars.where(type: chosen_car_type).sum(seat_type)
  end

  def departure_time(departure_station_id)
    if route.railway_stations_routes.find_by(railway_station_id: departure_station_id) 
      route.railway_stations_routes.find_by(railway_station_id: departure_station_id).departure_time
    else
      error_msg
    end
  end

  def arrival_time(arrival_station_id)
    if route.railway_stations_routes.find_by(railway_station_id: arrival_station_id)
      route.railway_stations_routes.find_by(railway_station_id: arrival_station_id).arrival_time
    else
      error_msg
    end
  end

  validates :name, :number, presence: true

  protected

  def error_msg
    "ERROR - no trains on this route"
  end
end
