class Api::V1::ReservationsController < ApplicationController
  def create
    payload_type = PayloadParser.get_type(params)
    render json: payload_type
  end
end