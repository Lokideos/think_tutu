class CattleCar < Car

  validates :top_seats, :bottom_seats, :lateral_top_seats, :lateral_bottom_seats, presence: :true
end