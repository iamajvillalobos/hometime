require "test_helper"

class AirbnbAttributesBuilderTest < ActiveSupport::TestCase
  test "#create_attributes" do
    params = {
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

    payload_type = 'airbnb'

    result = AirbnbAttributesBuilder.new.create_attributes(params, payload_type)

    assert_equal Guest.count, 1

    assert_equal result[:code], "YYYY12345674"
    assert_equal result[:source], 'airbnb'
  end
end
