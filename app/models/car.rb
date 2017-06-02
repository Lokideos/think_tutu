class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: :true
  validates :number_in_train, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :ordered_by_position, ->(order_type) {
    if order_type
      order(number_in_train: :asc)
    else
      order(number_in_train: :desc)
    end
  }

  scope :pick_type, ->(car_type) { where(type: car_type) }

  private

  def set_number
    self.number_in_train = train.cars.maximum(:number_in_train).to_i + 1
  end
end
