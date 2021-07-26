require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic = Mechanic.create!(name: 'Jamie', years_of_experience: 12)
    @amusement_park = AmusementPark.create!(name: 'Hair Metal', admission_price: 50)
    @ride_1 = Ride.create!(name: 'Twisted Sister', thrill_rating: 6, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Extreme', thrill_rating: 10, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Whitesnake', thrill_rating: 3, open: true, amusement_park_id: @amusement_park.id)

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

  it 'rides are listed by thrill rating in descending order' do
    expect(@ride_1.name).to appear_before(@ride_3.name)
  end

  it 'can add a new ride to work on' do
    ride_4 = Ride.create!(name: 'Poison', thrill_rating: 7, open: true, amusement_park_id: @amusement_park.id)

    fill_in(:ride_id, with: "#{ride_4.id}")
    click_button('Submit')

    expect(current_path).to eq("/mechanics/#{@mechanic.id}")
    expect(page).to have_content(ride_4.name)
  end
end
