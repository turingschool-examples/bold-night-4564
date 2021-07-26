require 'rails_helper'

RSpec.describe 'The mechanics show page' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)

    @ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = Ride.create!(name: 'Broken Gravitron', thrill_rating: 3, open: false)
    @ride4 = Ride.create!(name: 'Carousel', thrill_rating: 1, open: true)

    @mechanic1.work_orders.create!(ride: @ride1)
    @mechanic1.work_orders.create!(ride: @ride2)
    @mechanic1.work_orders.create!(ride: @ride3)
    @mechanic2.work_orders.create!(ride: @ride4)

    visit "/mechanics/#{@mechanic1.id}"
  end

  it 'displays the mechanics name, years of experience' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_of_experience)

  end

  it 'displays the names of all open rides they are working on' do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)

  end

  it 'does not display rides for other mechanics or closed rides' do

    expect(page).to_not have_content(@ride4.name)
  end

  it 'only displays rides that are open' do
    expect(page).to_not have_content(@ride3.name)
  end

  it 'displays the rides ordered by thrill rating descending order' do
    expect(@ride2.name).to appear_before(@ride1.name)
  end
end
