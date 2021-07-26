require 'rails_helper'
RSpec.describe 'Amusement Park Show Page' do
  before :each do
    @amusement_park = AmusementPark.create!(name: 'Hair Metal', admission_price: 50)
    @ride_1 = Ride.create!(name: 'Twisted Sister', thrill_rating: 6, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Extreme', thrill_rating: 10, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Whitesnake', thrill_rating: 3, open: true, amusement_park_id: @amusement_park.id)
    @ride_4 = Ride.create!(name: 'Poison', thrill_rating: 7, open: true, amusement_park_id: @amusement_park.id)
    visit "/amusementparks/#{@amusement_park.id}"
  end

  it 'shows amusement park and attributes' do
    expect(page).to have_content(@amusement_park.name)
    expect(page).to have_content(@amusement_park.admission_price)
  end
end
