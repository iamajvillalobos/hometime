class Api::V1::ReservationsController < ApplicationController
  def create
    payload_type = PayloadParser.get_type(params)
    reservation_attrs = PayloadParser.create_attributes(params, payload_type)

    reservation = Reservation.new(reservation_attrs)

    if reservation.save
      render json: { reservation: reservation }, status: :ok
    else
      render json: { error: reservation.errors.full_messages.to_sentence }, status: :ok
    end
  end
end
