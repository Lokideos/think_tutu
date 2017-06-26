class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional: true
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, optional: true
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, optional: true

  after_create :send_notification

  def route_name
  	"#{first_station.title} - #{last_station.title}"
  end

  validates :number, presence: true

  private

  def check_first_and_last_stations
    errors.add(:first_station, 'first station should not be equal to last station') if first_station_id == last_station_id
  end

  def send_notification
  	TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
