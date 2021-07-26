require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic = Mechanic.create!(name: 'Jamie', years_of_experience: 12)
    @ride_1 = Ride.create!(name: 'Twisted Sister', thrill_rating: 6, open: true)
    @ride_2 = Ride.create!(name: 'Extreme', thrill_rating: 10, open: false)
    @ride_3 = Ride.create!(name: 'Whitesnake', thrill_rating: 3, open: true)

    @mechanic.rides << @ride_1
    @mechanic.rides << @ride_2
    @mechanic.rides << @ride_3

    visit "/mechanics/#{@mechanic.id}"
  end

  it 'lists the mechanic and attributes include rides working on that are open' do
    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_of_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_3.name)
  end
end
