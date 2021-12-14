# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = []
  airports[0] = Airport.create(code: 'ODS', name: 'Odesa International Airport', city: 'Odesa')
  airports[1] = Airport.create(code: 'IEV', name: 'Kiev Zhulhany Airport', city: 'Kyiv')

DURATIONS ={
  'IEV' => {
    'ODS' => 80
  },
  'ODS' => {
    'IEV' => 80
  }
}

def get_duration(origin, destination)
  DURATIONS[origin][destination] || DURATIONS[destination][origin]
end

airports.each do |origin|
  airports.each do |destination|
    next if origin == destination

    2.times { Flight.create(departure: Date.new(2021, 12, 14),
                            origin_id: origin.id,
                            destination_id: destination.id,
                            duration: get_duration(origin.code, destination.code)
                            )
    }
  end
end
