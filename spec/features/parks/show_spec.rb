require 'rails_helper'

RSpec.describe 'Park show page' do
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park
  # And I see the names of all the rides that are at that theme park listed in alphabetical order
  # And I see the average thrill rating of this amusement park’s rides
  it 'displays the name and price of admissions for that amusement park' do
    park = Park.create!(name: 'Six Flags', price: 10)

    visit "/parks/#{park.id}"

    expect(page).to have_content(park.name)
    expect(page).to have_content(park.price)
  end

  it 'displays the names of all the rides that are at that theme park listed in alphabetical order' do
    park = Park.create!(name: 'Six Flags', price: 10)
    ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
    ride_2 = park.rides.create!(name: 'Carousel', thrill_rating: 3, open: true)
    ride_3 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)

    visit "/parks/#{park.id}"

    expect(page).to have_content("Rides that are at that theme park:")
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(ride_2.name).to appear_before(ride_1.name)
    expect(ride_1.name).to appear_before(ride_3.name)
  end

  it 'displays the average thrill rating of this amusement park’s rides' do
    park = Park.create!(name: 'Six Flags', price: 10)
    ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
    ride_2 = park.rides.create!(name: 'Carousel', thrill_rating: 3, open: true)
    ride_3 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)

    visit "/parks/#{park.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: #{park.average_thrill_rating}/10")
  end
end
