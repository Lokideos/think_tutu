class CattleCar < Car  

  validates :top_seats, :side_top_seats, :side_bottom_seats, presence: true
end