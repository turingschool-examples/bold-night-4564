require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  before :each do
    @mech_1 = Mechanic.create!(name: 'Todd', years_of_experience: 6)
    @ride_1 = Ride.create!(name: 'The Whirly Dirly', thrill_rating: 10, open: true)
    @ride_2 = Ride.create!(name: 'Frankenpants', thrill_rating: 20, open: false)
    @ride_3 = Ride.create!(name: 'Vomit World', thrill_rating: 30, open: true)
    @ride_mech_1 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_1)
    @ride_mech_2 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_2)
    @ride_mech_3 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_3)
  end

  it 'displays mechanic information' do
    visit "/mechanics/#{@mech_1.id}"
    expect(page).to have_content('Name: Todd')
    expect(page).to have_content('6 Years of Experience')
  end
  
end