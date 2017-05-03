class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars


  def cars_quantity_by_type (chosen_type)
    quantity = 0
    self.cars.each do |car|
      quantity += 1 if car.car_type == chosen_type
    end
    quantity
  end

  def seats_by_car_and_seat_types (chosen_car_type, seat_type)
    quantity = 0
    self.cars.each do |car|
      quantity += car.bottom_seats if car.car_type == chosen_car_type && seat_type == "bottom_seats"
      quantity += car.top_seats if car.car_type == chosen_car_type && seat_type == "top_seats"
    end
    quantity
  end  

  validates :name, :number, presence: true
end
