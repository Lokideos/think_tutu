class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional: true
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, optional: true
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, optional: true

  after_create :send_purchase_notification
  after_destroy :send_cancel_notification

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  validates :number, presence: true

  private

  def check_first_and_last_stations
    errors.add(:first_station, 'first station should not be equal to last station') if first_station_id == last_station_id
  end

  def send_purchase_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_cancel_notification
    TicketsMailer.cancel_ticket(user, self).deliver_now
  end
end
