class AddAdditionalDetailsToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :additional_details, :jsonb
  end
end
