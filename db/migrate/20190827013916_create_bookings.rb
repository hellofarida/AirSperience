class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_on
      t.date :end_on
      t.integer :price
      t.references :renter, foreign_key: { to_table: :users }
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
