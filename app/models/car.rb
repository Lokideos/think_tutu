class Car < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: :true
  validate :check_car_type

  private

  def check_car_type
    errors.add(:car_type, "Car type should be 'Cattle' or 'Coupe'") unless self.car_type == "Cattle" || "Coupe"
  end
end