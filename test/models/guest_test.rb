require "test_helper"

class GuestTest < ActiveSupport::TestCase
  test "cannot create guest with same email" do
    existing_guest = Guest.create(
      first_name: "Burton",
      last_name: "Lillibridge",
      phone: "3307591518",
      email: "burtonflillibridge@teleworm.us"
    )

    assert existing_guest.persisted?

    guest = Guest.new(
      first_name: "Burton",
      last_name: "Lillibridge",
      phone: "3307591518",
      email: "burtonflillibridge@teleworm.us"
    )

    assert_not guest.valid?
  end
end
