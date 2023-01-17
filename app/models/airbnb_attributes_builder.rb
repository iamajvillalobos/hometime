class AirbnbAttributesBuilder
  def create_attributes(params, payload_type)
    guest = Guest.find_or_create_by(
      first_name: params[:guest][:first_name],
      last_name: params[:guest][:last_name],
      phone: params[:guest][:phone],
      email: params[:guest][:email]
    )
    
    generate_attributes(params, payload_type, guest.id)
  end

  def update_attributes(params, payload_type, guest_id)
    generate_attributes(reservation, payload_type, guest_id)
  end

  private

  def generate_attributes(params, payload_type, guest_id)
    {
      code: params[:reservation_code],
      guest_id: guest_id,
      start_date: params[:start_date],
      end_date: params[:end_date],
      nights: params[:nights],
      adults: params[:adults],
      children: params[:children],
      status: params[:status],
      guests: params[:guests],
      currency: params[:currency],
      infants: params[:infants],
      payout_price: params[:payout_price],
      security_price: params[:security_price],
      total_price: params[:total_price],
      source: payload_type
    }
  end
end
