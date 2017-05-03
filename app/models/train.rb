class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  def cars_quantity_by_type (chosen_type)    
    cars.where(car_type: chosen_type).size
  end

  def seats_by_car_and_seat_types (chosen_car_type, seat_type)   
    cars.where(car_type: chosen_car_type).sum(seat_type)
  end  

  validates :name, :number, presence: true
end
