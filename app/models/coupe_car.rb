class CoupeCar < Car
  validates :top_seats, :bottom_seats, presence: true
end
