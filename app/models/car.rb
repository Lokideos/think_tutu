class Car < ApplicationRecord
  belongs_to :train

  validates :number, :seats, presence: :true
end