require 'rails_helper'

RSpec.describe 'park show page' do
  it 'can display parks attributes' do
    park_1 = Park.create!(name: 'Sunny Vale', admission: 10)
    mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
    mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)

    ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true, park_id: park_1.id)
    ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true, park_id: park_1.id)
    ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false, park_id: park_1.id)


    maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
    maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)
    maint_3 = Maintenence.create!(mechanic: mech_1, ride: ride_3)

    visit "/parks/#{park_1.id}"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_1.admission)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
  end

  it 'can display average thrill rating' do
    park_1 = Park.create!(name: 'Sunny Vale', admission: 10)
    mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
    mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)

    ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true, park_id: park_1.id)
    ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true, park_id: park_1.id)
    ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false, park_id: park_1.id)


    maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
    maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)
    maint_3 = Maintenence.create!(mechanic: mech_1, ride: ride_3)

    visit "/parks/#{park_1.id}"

    expect(page).to have_content("Average Thrill Rating: #{park_1.average_thrill_rating}")
  end
end
