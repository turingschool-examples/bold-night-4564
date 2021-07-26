require "rails_helper"

RSpec.describe 'the amusement park show' do
  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Six Flags', price: 50)
    @mechanic_1 = Mechanic.create!(name: 'Nick McIntyre', years_of_experience: 10)
    @ride_1 = @mechanic_1.rides.create!(name: 'The Titan', thrill_rating: 10, open: false, amusement_park_id: @amusement_park.id)
    @ride_2 = @mechanic_1.rides.create!(name: 'Batman', thrill_rating: 2, open: true, amusement_park_id: @amusement_park.id)
    @ride_3 = @mechanic_1.rides.create!(name: 'Superman', thrill_rating: 9, open: true, amusement_park_id: @amusement_park.id)
  end

  it 'displays attributes' do
    visit "/amusement_parks/#{@amusement_park.id}"

    within("#attributes") do
      expect(page).to have_content(@amusement_park.name)
      expect(page).to have_content(@amusement_park.price)
    end
  end

  it 'displays the rides rides' do
    visit "/amusement_parks/#{@amusement_park.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
  end

  it 'displays rides in alphabetical order' do
    visit "/amusement_parks/#{@amusement_park.id}"

    first = find("#ride-#{@ride_2.id}")
    mid = find("#ride-#{@ride_3.id}")
    last = find("#ride-#{@ride_1.id}")

    expect(first).to appear_before(mid)
    expect(mid).to appear_before(last)
  end

  it 'displays average thrill rating of rides' do
    visit "/amusement_parks/#{@amusement_park.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 7.0/10")
  end
end
