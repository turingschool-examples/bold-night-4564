# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all
MechanicRide.destroy_all

@mechanic_1 = Mechanic.create!(
  name: 'Michael',
  years_of_experience: 8
)
@mechanic_2 = Mechanic.create!(
  name: 'Dwight',
  years_of_experience: 7
)
@mechanic_3 = Mechanic.create!(
  name: 'Jim',
  years_of_experience: 4
)
@mechanic_4 = Mechanic.create!(
  name: 'Pam',
  years_of_experience: 10
)

@ride_1 = Ride.create!(
  name: 'Iron Rattler',
  thrill_rating: 8,
  open: true
)
@ride_2 = Ride.create!(
  name: 'The Void',
  thrill_rating: 9,
  open: true
)
@ride_3 = Ride.create!(
  name: 'Spunky Spin Bucket',
  thrill_rating: 4,
  open: true
)
@ride_4 = Ride.create!(
  name: 'Herb',
  thrill_rating: 10,
  open: false
)
@ride_5 = Ride.create!(
  name: 'Mars Attack!',
  thrill_rating: 6,
  open: true
)
