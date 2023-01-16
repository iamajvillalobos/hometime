class AddSourceToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :source, :string
    add_index :reservations, :source
  end
end
