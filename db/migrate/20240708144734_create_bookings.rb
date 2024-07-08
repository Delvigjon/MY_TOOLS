class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :location_date
      t.string :status

      t.timestamps
    end
  end
end
