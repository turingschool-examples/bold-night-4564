require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do
  # Story 2 - Mechanic Show Page
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)
  it 'displays mechanic attributes and associated rides that are open' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Sean King', years_of_experience: 6)

    ride_1 = mech_1.rides.create!(name: 'Sidewinder', thrill_rating: 9, open: true)
    ride_2 = mech_1.rides.create!(name: 'Octothrope', thrill_rating: 7, open: true)
    ride_3 = mech_1.rides.create!(name: 'Clown Maze', thrill_rating: 2, open: false)

    visit "/mechanics/#{mech_1.id}"

    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_of_experience)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to_not have_content(ride_3.name)

    expect(page).to_not have_content(mech_2.name)
    expect(page).to_not have_content(mech_2.years_of_experience)
  end

  it 'lists open rides by thrill rating in descending order' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Sean King', years_of_experience: 6)

    ride_1 = mech_1.rides.create!(name: 'Octothrope', thrill_rating: 7, open: true)
    ride_2 = mech_1.rides.create!(name: 'Sidewinder', thrill_rating: 9, open: true)
    ride_3 = mech_1.rides.create!(name: 'Clown Maze', thrill_rating: 2, open: false)
    ride_4 = mech_1.rides.create!(name: 'Twister', thrill_rating: 6, open: true)

    visit "/mechanics/#{mech_1.id}"

    expect(ride_2.name).to appear_before(ride_1.name)
    expect(ride_1.name).to appear_before(ride_4.name)
  end

  # Story 3 - Add a Ride to a Mechanic
  # As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page
  it 'has a form to add a ride to their workload' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)

    ride_1 = mech_1.rides.create!(name: 'Octothrope', thrill_rating: 7, open: true)
    ride_2 = mech_1.rides.create!(name: 'Sidewinder', thrill_rating: 9, open: true)
    ride_3 = mech_1.rides.create!(name: 'Clown Maze', thrill_rating: 2, open: false)
    ride_4 = mech_1.rides.create!(name: 'Twister', thrill_rating: 6, open: true)
    ride_5 = Ride.create!(name: 'Gremlins', thrill_rating: 4, open: true)

    visit "/mechanics/#{mech_1.id}"

    expect(page).to have_content('Add a Ride to Workload')
    expect(page).to have_button('Add Ride')
  end

  xit 'adds ride to mechanic show page' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)

    ride_1 = mech_1.rides.create!(name: 'Octothrope', thrill_rating: 7, open: true)
    ride_2 = mech_1.rides.create!(name: 'Sidewinder', thrill_rating: 9, open: true)
    ride_3 = mech_1.rides.create!(name: 'Clown Maze', thrill_rating: 2, open: false)
    ride_4 = mech_1.rides.create!(name: 'Twister', thrill_rating: 6, open: true)
    ride_5 = Ride.create!(name: 'Gremlins', thrill_rating: 4, open: true)

    visit "/mechanics/#{mech_1.id}"

    fill_in('Ride ID:', with: ride_5.id)
    click_on('Add Ride')

    expect(page).to have_content(ride_5.name)
  end
end
