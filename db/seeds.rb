# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
@mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)

@disney = AmusementPark.create!(name: 'Disney World', price: 125)

@ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
@ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
@ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
@ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

@mechanic1.work_orders.create!(ride: @ride1)
@mechanic1.work_orders.create!(ride: @ride2)
@mechanic1.work_orders.create!(ride: @ride3)
@mechanic2.work_orders.create!(ride: @ride4)
