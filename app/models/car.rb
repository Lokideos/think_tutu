class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: :true
  validates :type, inclusion: { in: %w[CattleCar CoupeCar SVCar SeatCar], message: '%{value} is not a valid car type' }
end
