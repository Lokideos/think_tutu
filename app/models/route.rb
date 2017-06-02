class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  def stations_in_route    
    self.railway_stations_routes.ordered    
  end

  validates :name, presence: true
end