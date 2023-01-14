require 'test_helper'

class PayloadParserTest < ActiveSupport::TestCase
  test ".get_type returns correct type based on params" do
    airbnb_params = {
      "reservation_code": "YYYY12345674",
      "start_date": "2021-04-14",
      "end_date": "2021-04-18",
      "nights": 4,
      "guests": 4,
      "adults": 2,
      "children": 2,
      "infants": 0,
      "status": "accepted",
      "guest": {
        "first_name": "Wayne",
        "last_name": "Woodbridge",
        "phone": "639123456789",
        "email": "wayne_woodbridge@bnb.com"
      },
      "currency": "AUD",
      "payout_price": "4200.00",
      "security_price": "500",
      "total_price": "4700.00"
    }

    booking_params = {
      "reservation": {
        "code": "XXX12345671",
        "start_date": "2021-03-12",
        "end_date": "2021-03-16",
        "expected_payout_amount": "3800",
        "guest_details": {
          "localized_description": "4 guests",
          "number_of_adults": 2,
          "number_of_children": 2,
          "number_of_infants": 0
        },
        "guest_email": "wayne_woodbridge@bnb.com",
        "guest_first_name": "Wayne",
        "guest_last_name": "Woodbridge",
        "guest_phone_numbers": [
          "639123456789",
          "639123456789"
        ],
        "listing_security_price_accurate": "500.00",
        "host_currency": "AUD",
        "nights": 4,
        "number_of_guests": 4,
        "status_type": "accepted",
        "total_paid_amount_accurate": "4300.00"
      }
    }

    result_1 = PayloadParser.get_type(
      append_controller_params(airbnb_params).with_indifferent_access
    )

    assert_equal result_1, :airbnb

    result_2 = PayloadParser.get_type(
      append_controller_params(booking_params).with_indifferent_access
    )

    assert_equal result_2, :booking
  end

  def append_controller_params(params)
    params.merge(
      "controller": "",
      "action": "",
      "reservation": ""
    )
  end
end
