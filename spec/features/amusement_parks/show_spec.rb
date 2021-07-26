require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before :each do
    @park_1 = AmusementPark.create!(name: 'Disney World', price_of_admission: 75)

    @ride_1 = @park_1.rides.create!(name: 'Mine Train', thrill_rating: 2, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Big Thunder', thrill_rating: 8, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Space Mountain', thrill_rating: 7, open: false)
    @ride_4 = @park_1.rides.create!(name: 'The Barnstormer', thrill_rating: 9, open: true)
    @ride_5 = @park_1.rides.create!(name: 'Laugh Floor', thrill_rating: 6, open: true)
  end

  it 'displays the name and admissions price for the park' do
    visit "/amusement_parks/#{@park_1.id}"

    expect(page).to have_content(@park_1.name)
    expect(page).to have_content("Admissions: $#{@park_1.price_of_admission}")
  end

  it 'displays all of the rides in alphabetical order' do
    visit "/amusement_parks/#{@park_1.id}"

    expect(@ride_1.name).to appear_before(@ride_4.name)
    expect(@ride_5.name).to appear_before(@ride_3.name)
    expect(@ride_1.name).to_not appear_before(@ride_2.name)
  end

  it 'displays the average thrill ride for the park' do
    visit "/amusement_parks/#{@park_1.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 6.4/10")
  end
end
