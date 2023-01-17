require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "return 200 when successfully creating a reservation" do
    params = {
      "reservation": {
        "code": "123892",
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

    post api_v1_reservations_url, params: params

    assert_response :success
  end

  test "returns 422 when payload format is not supported when creating" do
    params = {
      "reservation_format": {
        "code": "123892",
      }
    }

    post api_v1_reservations_url, params: params

    assert_response :unprocessable_entity
  end

  test "returns an error message if no reservation found when updating" do
    params = {
      "reservation": {
        "guest_details": {
          "localized_description": "5 guests",
          "number_of_adults": 4,
          "number_of_children": 2,
          "number_of_infants": 0
        },
        "number_of_guests": 6
      }
    }

    error_message = 'No reservation found. Please check id.'

    patch api_v1_reservation_url(id: 1), params: params

    assert_match error_message, response.body
    assert_response :unprocessable_entity
  end

  test "returns an updated reservation object when successfully updating" do
    guest = Guest.create(
      first_name: "Burton",
      last_name: "Lillibridge",
      phone: "3307591518",
      email: "burtonflillibridge@teleworm.us"
    )

    existing_reservation = Reservation.create(
      id: 3,
      code: "11111111",
      guest: guest,
      guests: 5,
      source: "booking"
    )

    params = {
      "reservation": {
        "number_of_guests": 6
      },
      "id": existing_reservation.id
    }

    assert_equal existing_reservation.guests, 5

    patch api_v1_reservation_url(id: existing_reservation.id), params: params

    existing_reservation.reload
    assert_equal existing_reservation.guests, 6

    assert_equal existing_reservation.as_json, JSON.parse(response.body)
  end
end
