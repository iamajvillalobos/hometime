require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test "cannot create reservation with same code" do
    guest = Guest.create(
      first_name: "Burton",
      last_name: "Lillibridge",
      phone: "3307591518",
      email: "burtonflillibridge@teleworm.us"
    )

    existing_reservation = Reservation.create(
      code: "YYYY12345678",
      guest: guest
    )

    assert existing_reservation.persisted?

    reservation = Reservation.new(
      code: "YYYY12345678",
      guest: guest
    )

    assert_not reservation.valid?
  end
end
