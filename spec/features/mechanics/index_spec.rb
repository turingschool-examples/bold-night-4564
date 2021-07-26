require 'rails_helper'
RSpec.describe 'shows the index feature page of the mechanics' do
  before :each do
    @amusement_park1 = AmusementPark.create!(name: "Elitches", price_of_admission: 50)
    @amusement_park2 = AmusementPark.create!(name: "Lake Side", price_of_admission: 30)
  
    @ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true, amusement_parks_id: @amusement_park1.id)
    @ride2 = Ride.create!(name: "Side Winder", thrill_rating: 4, open: true, amusement_parks_id: @amusement_park1.id)
    @ride3 = Ride.create!(name: "Tower O Doom", thrill_rating: 10, open: true, amusement_parks_id: @amusement_park1.id)
    @ride4 = Ride.create!(name: "Shake Rattle and Roll", thrill_rating: 1, open: false, amusement_parks_id: @amusement_park1.id)
    @ride5 = Ride.create!(name: "Twister 2 ", thrill_rating: 9, open: true, amusement_parks_id: @amusement_park1.id)

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

    visit "/mechanics"
  end

  it 'can visit the correct path' do
    expect(current_path).to eq("/mechanics")
  end

  it 'shows a page with all the mechanics names and their years of experience' do
    expect(page).to have_content("All Mechanics")

    mechanics = [@mechanic1,@mechanic2, @mechanic3, @mechanic4]

    mechanics.each do |mechanic|
      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.years_of_experience)
    end
  end

  it 'shows the average years of all the mechanics' do
    expect(page).to have_content("Average years of work Experience: 5.25 years") 
  end
end