Maintenance.destroy_all
Mechanic.destroy_all
Ride.destroy_all

@ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
@ride2 = Ride.create!(name: "Side Winder", thrill_rating: 4, open: true)
@ride3 = Ride.create!(name: "Tower O Doom", thrill_rating: 10, open: true)
@ride4 = Ride.create!(name: "Shake Rattle and Roll", thrill_rating: 1, open: false)
@ride5 = Ride.create!(name: "Twister 2 ", thrill_rating: 9, open: true)

@mechanic1 = Mechanic.create!(name: "Bob", years_of_experience: 7)
@mechanic2 = Mechanic.create!(name: "Jim", years_of_experience: 1)
@mechanic3 = Mechanic.create!(name: "Clyde", years_of_experience: 3)
@mechanic4 = Mechanic.create!(name: "Charles", years_of_experience: 10)

@maintenance1 = Maintenance.create!(mechanic_id: @mechanic4.id, ride_id: @ride4.id)
@maintenance2 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride4.id)
@maintenance3 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride3.id)
@maintenance4 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride3.id)
@maintenance5 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride2.id)
@maintenance6 = Maintenance.create!(mechanic_id: @mechanic3.id, ride_id: @ride1.id)
@maintenance7 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
@maintenance8 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride2.id)