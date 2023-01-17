class Api::V1::ReservationsController < ApplicationController
  def create
    payload_type = PayloadParser.get_type(params)

    if payload_type == PayloadParser::TYPE_NOT_SUPPORTED
      render json: { error: 'Payload format not supported' },
        status: :unprocessable_entity
      return
    end

    reservation_attrs = PayloadParser.create_attributes(params, payload_type)

    reservation = Reservation.new(reservation_attrs)

    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { error: reservation.errors.full_messages.to_sentence },
        status: :unprocessable_entity
    end
  end

  def update
    reservation = Reservation.find_by(id: params[:id])

    if !reservation
      render json: { error: 'No reservation found. Please check id.' },
        status: :unprocessable_entity
      return
    end

    reservation_attrs = PayloadParser.update_attributes(
      params,
      reservation.source.to_sym,
      reservation.guest.id,
    )

    if reservation.update(reservation_attrs)
      render json: reservation, status: :ok
    else
      render json: { error: reservation.errors.full_messages.to_sentence },
        status: :unprocessable_entity
    end
  end
end
