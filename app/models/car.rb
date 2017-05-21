class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, :bottom_seats, presence: :true
  validates :number_in_train, uniqueness: { scope: :train_id } 

  before_save :set_number

  private

  def set_number
    self.number_in_train = train.cars.length + 1 if self.train_id
  end
end
