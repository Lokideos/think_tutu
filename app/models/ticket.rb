class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :user
  belongs_to :train
  has_many :railway_stations_tickets
  has_many :railway_stations, through: :railway_stations_tickets
end
