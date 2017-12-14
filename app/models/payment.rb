class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |_name, i| [(i + 1).to_s, i + 1]}
  end

  def self.year_options
    (Time.zone.today.year..(Time.zone.today.year + 10)).to_a
  end

  def process_payment
    customer = Stripe::Customer.create email: email, card: token
    Stripe::Charge.create customer: customer.id,
                          amount: Reservation.last.total * 100,
                          description: 'Réservation Hetic-BnB',
                          currency: 'eur'
  end
end
