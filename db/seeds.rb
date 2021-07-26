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
@universal = AmusementPark.create!(name: 'Universal Studios', price: 115)
@busch = AmusementPark.create!(name: 'Busch Gardens', price: 115)


@ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
@ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
@ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
@ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

@ride5 = @universal.rides.create!(name: 'Hulk', thrill_rating: 10, open: true)
@ride6 = @universal.rides.create!(name: 'Harry Potter', thrill_rating: 8, open: true)
@ride7 = @universal.rides.create!(name: 'Jaws', thrill_rating: 6, open: true)
@ride8 = @universal.rides.create!(name: 'Car disaster', thrill_rating: 7, open: true)

@ride9 = @busch.rides.create!(name: 'Montu', thrill_rating: 10, open: true)
@ride10 = @busch.rides.create!(name: 'Sheikra', thrill_rating: 9, open: true)
@ride11 = @busch.rides.create!(name: 'Kumba', thrill_rating: 8, open: true)
@ride12 = @busch.rides.create!(name: 'River Rapids', thrill_rating: 4, open: true)


@mechanic1.work_orders.create!(ride: @ride1)
@mechanic1.work_orders.create!(ride: @ride2)
@mechanic1.work_orders.create!(ride: @ride3)
@mechanic2.work_orders.create!(ride: @ride4)
