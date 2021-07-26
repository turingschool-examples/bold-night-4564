# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Amusement Parks

park_1 = AmusementPark.create!(name: 'Blips and Chitz', admission_price: 30.0)
park_2 = AmusementPark.create!(name: 'Whale World', admission_price: 100.0)

# Mechanics

mech_1 = Mechanic.create!(name: 'Todd', years_of_experience: 5)
mech_2 = Mechanic.create!(name: 'Bill', years_of_experience: 11)
mech_3 = Mechanic.create!(name: 'Amy', years_of_experience: 9)
mech_4 = Mechanic.create!(name: 'Jordan', years_of_experience: 3)
mech_5 = Mechanic.create!(name: 'Pat', years_of_experience: 7)

# Rides

ride_1 = park_1.rides.create!(name: 'The Whirly Dirly', thrill_rating: 10, open: true)
ride_2 = park_1.rides.create!(name: 'Frankenpants', thrill_rating: 20, open: false)
ride_3 = park_1.rides.create!(name: 'Vomit World', thrill_rating: 30, open: true)
ride_4 = park_2.rides.create!(name: 'Cheese Wheel', thrill_rating: 40, open: false)
ride_5 = park_2.rides.create!(name: 'Goat Rush', thrill_rating: 41, open: true)

# Ride Mechanics

ride_mech_1 = RideMechanic.create!(mechanic: mech_1, ride: ride_1)
ride_mech_2 = RideMechanic.create!(mechanic: mech_1, ride: ride_2)
ride_mech_3 = RideMechanic.create!(mechanic: mech_2, ride: ride_3)
ride_mech_4 = RideMechanic.create!(mechanic: mech_2, ride: ride_4)