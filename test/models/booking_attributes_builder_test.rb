require "test_helper"

class BookingAttributesBuilderTest < ActiveSupport::TestCase
  test "#create_attributes" do
    params = {
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

    payload_type = 'booking'

    result = BookingAttributesBuilder.new.create_attributes(params, payload_type)

    assert_equal Guest.count, 1

    assert_equal result[:code], "XXX12345671"
    assert_equal result[:source], 'booking'
  end
end
