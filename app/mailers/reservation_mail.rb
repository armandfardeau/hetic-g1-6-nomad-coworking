class ReservationMailer < ApplicationMailer
  def new_reservation_owner(room, reservation)
    @user = User.find(room.user_id)
    @reservation = reservation
    @room = room
    mail(
        to: @user.email,
        subject: 'New reservation !'
    )
  end

  def new_reservation_visitor(room, reservation)
    @user = User.find(room.user_id)
    @reservation = reservation
    @room = room
    mail(
        to: @user.email,
        subject: 'New reservation !'
    )
  end
end
