class Car < ApplicationRecord
  belongs_to :train

  validates :number, :bottom_seats, presence: :true  
end
