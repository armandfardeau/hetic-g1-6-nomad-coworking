class ReservationMailer < ApplicationMailer
  def new_reservation_owner(office, reservation)
    @user = User.find(office.user_id)
    @reservation = reservation
    @office = office
    mail(
        to: @user.email,
        subject: 'New reservation !'
    )
  end

  def new_reservation_visitor(office, reservation)
    @user = User.find(office.user_id)
    @reservation = reservation
    @office = office
    mail(
        to: @user.email,
        subject: 'New reservation !'
    )
  end
end
