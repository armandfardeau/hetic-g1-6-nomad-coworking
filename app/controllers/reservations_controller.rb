class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to @reservation.room, notice: 'Your booking has been accepted.'
  end

  def preload
    room = Room.find(params[:room_id])
    reservations = room.reservations.bookable
    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    output = {
        conflict: conflict(start_date, end_date)
    }
    render json: output
  end

  def trips
    @trips = current_user.reservations
  end

  def bookings
    @rooms = current_user.rooms
  end

  private

  def conflict(start_date, end_date)
    room = Room.find(params[:room_id])
    check = room.reservations.available(start_date, end_date)
    check unless check.empty?
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
  end
end
