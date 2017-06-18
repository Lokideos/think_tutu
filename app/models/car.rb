class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: :true
  validates :number_in_train, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :ordered_by_position, ->(order_type) {
    if order_type
      order(number_in_train: :asc)
    else
      order(number_in_train: :desc)
    end
  }

  scope :coupe, -> { where(type: 'CoupeCar') }

  scope :cattle, -> { where(type: 'CattleCar') }

  scope :sv, -> { where(type: 'SvCar') }

  scope :seat_only, -> { where(type: 'SeatOnlyCar') }

  private

  def set_number
    self.number_in_train = train.cars.maximum(:number_in_train).to_i + 1
  end
end
