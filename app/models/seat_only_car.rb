class SeatOnlyCar < Car
  validates :seat_only_places, presence: true
end
