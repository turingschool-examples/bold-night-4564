require 'rails_helper'

RSpec.describe 'the amusement park show page' do
  it 'show the name and price of admissions for that amusement park, lists all the name of the rides that are at that park in alphabetical order and it display the average thrill rating of all the parks rides' do
  # Extension - Amusement Park Show page
  #
  # As a visitor,
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park
  # And I see the names of all the rides that are at that theme park listed in alphabetical order
  # And I see the average thrill rating of this amusement park’s rides
  # Ex: Hershey Park
  #    Admissions: $50.00
  #
  #    Rides:
  #           1. Lightning Racer
  #           2. Storm Runner
  #           3. The Great Bear
  #    Average Thrill Rating of Rides: 7.8/10
  #
  # Note: You may have to make new migrations for this story
    park = AmusementPark.create!(name: 'Six Flags', admission: 50)
    ride1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    ride2 = park.rides.create!(name: 'Kamikaze', thrill_rating: 10, open: true)
    ride3 = park.rides.create!(name: 'Swings', thrill_rating: 5, open: false)
    ride4 = park.rides.create!(name: 'Pirate Ship', thrill_rating: 8, open: true)

    visit "/amusement_parks/#{park.id}"

    save_and_open_page
    expect(page).to have_content(park.name)
    expect(page).to have_content(park.admission)
    expect(page).to have_content("Rides:")
    expect(ride1.name).to appear_before(ride2.name)
    expect(ride2.name).to appear_before(ride4.name)
    expect(ride4.name).to appear_before(ride3.name)
    expect(page).to have_content("Average Thrill Rating of Rides: 6.8/10")
  end
end
