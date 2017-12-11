class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :available, ->(start_date, end_date) { where("? < start_date AND end_date < ?", start_date, end_date)}
  scope :bookable, ->(today = Date.today) { where("start_date >= ? OR end_date >= ?", today, today)}
end
