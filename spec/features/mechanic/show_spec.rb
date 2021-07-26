require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  # Story 2 - Mechanic Show Page
  #
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)
  it 'lists a mechanics name, years_of_experience, and the names of all rides they are working on (only open rides and listed in descending order of thrill rating)' do
    mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 10)
    ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    ride2 = Ride.create!(name: 'Kamikaze', thrill_rating: 10, open: true)
    ride3 = Ride.create!(name: 'Swings', thrill_rating: 5, open: false)
    ride4 = Ride.create!(name: 'Pirate Ship', thrill_rating: 8, open: true)
    MechanicRide.create!(mechanic: mech1, ride: ride1)
    MechanicRide.create!(mechanic: mech1, ride: ride2)
    MechanicRide.create!(mechanic: mech1, ride: ride3)
    MechanicRide.create!(mechanic: mech1, ride: ride4)

    visit "/mechanics/#{mech1.id}"

    expect(page).to have_content(mech1.name)
    expect(page).to have_content(mech1.years_of_experience)
    expect(page).to have_content("Rides working on:")
    expect(ride2.name).to appear_before(ride4.name)
    expect(ride4.name).to appear_before(ride1.name)
    expect(page).to_not have_content(ride3.name)
  end

  it 'can add a ride to a mechanic by ride id' do
    # Story 3 - Add a Ride to a Mechanic
    #
    # As a user,
    # When I go to a mechanics show page
    # I see a form to add a ride to their workload
    # When I fill in that field with an id of an existing ride and hit submit
    # I’m taken back to that mechanic's show page
    # And I see the name of that newly added ride on this mechanics show page
    mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 10)
    ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    ride2 = Ride.create!(name: 'Kamikaze', thrill_rating: 10, open: true)
    ride3 = Ride.create!(name: 'Pirate Ship', thrill_rating: 8, open: true)
    ride4 = Ride.create!(name: 'Swings', thrill_rating: 5, open: true)
    MechanicRide.create!(mechanic: mech1, ride: ride1)
    MechanicRide.create!(mechanic: mech1, ride: ride2)
    MechanicRide.create!(mechanic: mech1, ride: ride3)

    visit "/mechanics/#{mech1.id}"
    expect(page).to_not have_content(ride4.name)
    expect(page).to have_content("Add Ride to Mechanic's Workload:")
    expect(page).to have_button("Add Ride!")

    fill_in('ride_id', with: "#{ride4.id}")
    click_button('Add Ride!')

    save_and_open_page
    expect(current_path).to eq("/mechanics/#{mech1.id}")
    expect(page).to have_content(ride4.name)
  end
end
