class Passenger < ApplicationRecord
  has_many :bookings, inverse_of: :passenger
end
