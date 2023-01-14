class BookingAttributesBuilder
  def create_attributes(params)
    reservation = params[:reservation]

    guest = Guest.find_or_create_by(
      first_name: reservation[:guest_first_name],
      last_name: reservation[:guest_last_name],
      phone: reservation[:guest_phone_numbers].first,
      email: reservation[:guest_email]
    )

    {
      code: reservation[:code],
      guest_id: guest.id,
      start_date: reservation[:start_date],
      end_date: reservation[:end_date],
      nights: reservation[:nights],
      adults: reservation[:guest_details][:number_of_adults],
      children: reservation[:guest_details][:number_of_children],
      status: reservation[:status_type],
      guests: reservation[:number_of_guests],
      currency: reservation[:host_currency],
      infants: reservation[:number_of_infants] || 0,
      payout_price: reservation[:expected_payout_amount],
      security_price: reservation[:listing_security_price_accurate],
      total_price: reservation[:total_paid_amount_accurate]
    }
  end
end
