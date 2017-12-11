class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :available, ->(start_date, end_date) {where('? < start_date AND end_date < ?', start_date, end_date)}
  scope :bookable, ->(today = Time.zone.today) {where('start_date >= ? OR end_date >= ?', today, today)}
  scope :booked, ->(room, user = current_user) {where('room_id = ? AND user_id = ?', room.id, user.id).present?}
end
