class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  def cars_quantity_by_type(chosen_type)
    cars.where(type: chosen_type).size
  end

  # Needed method
  def seats_by_car_and_seat_types(chosen_car_type, seat_type)
    cars.where(type: chosen_car_type).sum(seat_type)
  end

  def sort_cars_by_position
    if sort_type
      cars.order(number_in_train: :asc)
    else
      cars.order(number_in_train: :desc)
    end
  end

  validates :name, :number, presence: true
end
