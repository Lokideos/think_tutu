class SeatCar < Car

  validates :seat_places, presence: :true
end