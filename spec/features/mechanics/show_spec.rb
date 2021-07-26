require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)
  it 'displays name, years of experience for the mechanic' do
    mechanic = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.years_of_experience)
  end

  it 'displays names of all the open rides this mechanic is working on ordered by thrill rating (most thrills first)' do
    mechanic = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
    park = Park.create!(name: 'Six Flags', price: 10)
    ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
    ride_2 = park.rides.create!(name: 'Busted Ferris Wheel', thrill_rating: 5, open: false)
    ride_3 = park.rides.create!(name: 'Carousel', thrill_rating: 2, open: true)
    ride_4 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    Workload.create!(ride: ride_1, mechanic: mechanic)
    Workload.create!(ride: ride_2, mechanic: mechanic)
    Workload.create!(ride: ride_4, mechanic: mechanic)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_4.name)
    expect(page).to_not have_content(ride_2.name)
    expect(page).to_not have_content(ride_3.name)
    expect(ride_4.name).to appear_before(ride_1.name)
  end

  # Story 3 - Add a Ride to a Mechanic
  #
  # As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page
  it 'has a form to add a ride for a mechanics workload' do
    mechanic = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
    park = Park.create!(name: 'Six Flags', price: 10)
    ride = park.rides.create!(name: 'Carousel', thrill_rating: 2, open: true)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content('Add a ride for a mechanic:')

    fill_in :ride_id, with: ride.id
    click_button 'Submit'

    expect(current_path).to eq("/mechanics/#{mechanic.id}")
    expect(page).to have_content(ride.name)
  end
end
