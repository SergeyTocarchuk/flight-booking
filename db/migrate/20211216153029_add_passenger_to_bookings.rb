class AddPassengerToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :passenger
  end
end
