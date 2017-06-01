class Car < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, presence: :true
  validates :number_in_train, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :ordered_by_position, -> (order_type) { order(:number_in_train => order_type) }

  private

  def set_number
    self.number_in_train = train.cars.length + 1 if train_id
  end
end
