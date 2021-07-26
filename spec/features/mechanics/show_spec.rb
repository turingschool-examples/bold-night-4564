require 'rails_helper'

RSpec.describe 'mechanic show page' do
  it 'lists name, years of exp, and names of rides they work on' do
    mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
    mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)

    ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true)
    ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true)
    ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false)


    maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
    maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)

    visit "/mechanics/#{mech_1.id}"

    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_of_experience)
    expect(page).to have_content("Currently Maintaining:")
    expect(ride_2.name).to appear_before(ride_1.name)
    expect(page).to_not have_content(ride_3.name)
  end

  it 'can add a ride to mechanic' do
    mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)

    ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true)
    ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true)
    ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false)
    ride_4 = Ride.create!(name: "Jail", thrill_rating: 10, open: true)

    maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
    maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)

    visit "/mechanics/#{mech_1.id}"

    expect(page).to have_content("Add a ride to mechanic's workload:")
    expect(page).to have_button("Add ride")

    fill_in 'ride_id', with: "#{ride_4.id}"
    click_button 'Add ride'

    expect(current_path).to eq("/mechanics/#{mech_1.id}")
    expect(page).to have_content(ride_4.name)
  end
end
