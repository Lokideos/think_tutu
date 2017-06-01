class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: :true
  validates :number_in_train, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :ordered_by_position, ->(order_type) { order(number_in_train: order_type) }

  scope :ordered_by_type, ->(car_type) { where(type: car_type) }

  private

  def set_number
    self.number_in_train = if train.cars.empty?
                             1
                           else
                             train.cars.last.number_in_train + 1
                           end
  end
end
