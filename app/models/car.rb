class Car < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: :true
  validates :car_type, inclusion: { in: %w[Cattle Coupe], message: '%{value} is not a valid car type' }
end
