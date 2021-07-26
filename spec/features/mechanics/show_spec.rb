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

  it 'lists rides by thrill rating in descending order'
end
