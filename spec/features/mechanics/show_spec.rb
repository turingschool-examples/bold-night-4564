require 'rails_helper'

RSpec.describe 'the mechanics show' do
  before :each do
    @mechanic_1 = Mechanic.create!(
      name: 'Michael',
      years_of_experience: 8
    )
    @mechanic_2 = Mechanic.create!(
      name: 'Dwight',
      years_of_experience: 7
    )
    @ride_1 = Ride.create!(
      name: 'Iron Rattler',
      thrill_rating: 8,
      open: true
    )
    @ride_2 = Ride.create!(
      name: 'The Void',
      thrill_rating: 9,
      open: true
    )
    @ride_3 = Ride.create!(
      name: 'Spunky Spin Bucket',
      thrill_rating: 4,
      open: true
    )
    @ride_4 = Ride.create!(
      name: 'Herb',
      thrill_rating: 10,
      open: false
    )

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
  end

  it 'lists mechanics attributes' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content('Michael')
    expect(page).to have_content(8)
    expect(page).to_not have_content('Dwight')
  end

  it 'lists rides mechanic is working on that are open' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content('Iron Rattler')
    expect(page).to have_content('The Void')
    expect(page).to have_content('Spunky Spin Bucket')
    expect(page).to_not have_content('Herb')
  end

  it 'lists rides with most thrills first in descending order' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect('The Void').to appear_before('Iron Rattler')
    expect('Iron Rattler').to appear_before('Spunky Spin Bucket')
  end
end
