class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger, inverse_of: :bookings

  accepts_nested_attributes_for :passenger
end
