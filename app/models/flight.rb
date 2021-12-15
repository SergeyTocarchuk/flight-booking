class Flight < ApplicationRecord
  attr_accessor :tickets
  belongs_to :origin, class_name: "Airport"
  belongs_to :destination, class_name: "Airport"
end