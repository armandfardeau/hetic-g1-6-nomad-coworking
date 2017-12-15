class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    return unless @reservation.persisted?
    @payment = Payment.new(
        email: User.find(@reservation.user_id).email,
        token: params[:payment]['token'],
        reservation_id: @reservation.id,
        amount: @reservation.total
    )
    begin
      @payment.process_payment
      if @payment.save
        ReservationMailer.new_reservation_owner(Office.find(@reservation.office_id), @reservation).deliver_later
        ReservationMailer.new_reservation_visitor(current_user.id, @reservation).deliver_later
        redirect_to @reservation.office, notice: 'Your reservation has been accepted'
      end
    rescue StandardError
      @reservation.destroy
      logger.error 'Payement failed'
      redirect_to @reservation.office, notice: 'Your payement has been declined '
    end
    redirect_to @reservation.office, notice: 'Your booking has been accepted.'
  end

  def preload
    office = Office.find(params[:office_id])
    reservations = office.reservations.bookable
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

  def pasts
    @pasts = current_user.reservations
  end

  def bookings
    @offices = current_user.offices
  end

  private

  def conflict(start_date, end_date)
    office = Office.find(params[:office_id])
    check = office.reservations.available(start_date, end_date)
    check unless check.empty?
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :office_id, :payement)
  end
end
