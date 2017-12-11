class Room < ApplicationRecord
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :reservations, dependent: :delete_all
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :delete_all
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 75}
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :price, numericality: {only_integer: true, greater_than: 5}
  geocoded_by :address

  def average_rating
    return 0 if reviews.count.zero?
    reviews.average(:star).round(2)
  end
end
