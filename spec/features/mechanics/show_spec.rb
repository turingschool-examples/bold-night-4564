require 'rails_helper'

RSpec.describe 'mechanics show page' do
  before :each do
    @park_1 = AmusementPark.create!(name: 'Disney World', price_of_admission: 75)

    @mechanic_1 = Mechanic.create!(name: 'Robert', years_of_experience: 27)

    @ride_1 = @park_1.rides.create!(name: 'Big Thunder', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Mine Train', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Space Mountain', thrill_rating: 7, open: false)
    @ride_4 = @park_1.rides.create!(name: 'The Barnstormer', thrill_rating: 9, open: true)
    @ride_5 = @park_1.rides.create!(name: 'Wildlife Express', thrill_rating: 5, open: false)
    @ride_6 = @park_1.rides.create!(name: 'Laugh Floor', thrill_rating: 6, open: true)
    @ride_7 = @park_1.rides.create!(name: 'Mad Tea Party', thrill_rating: 4, open: true)

    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_1)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_2)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_3)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_4)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_5)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_6)
  end
  #user story 2
  it 'displays mechanic name and years of experience' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)
  end
  #user story 2
  it 'displays all open rides that the mechanic is working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to_not have_content(@ride_5.name)
    expect(page).to have_content(@ride_6.name)
  end
  #user story 2
  it 'displays the rides by thrill raiting in desc order' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(@ride_4.name).to appear_before(@ride_2.name)
    expect(@ride_2.name).to_not appear_before(@ride_1.name)
    expect(@ride_6.name).to appear_before(@ride_2.name)
  end
  #user story 3
  it 'has a form to add an exisiting ride to mechanics list' do
    visit "/mechanics/#{@mechanic_1.id}"

    fill_in 'Ride Id:', with: "#{@ride_7.id}"
    click_on 'Add'
    
    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(@ride_7.name).to appear_before(@ride_2.name)
    expect(@ride_7.name).to_not appear_before(@ride_6.name)
  end
end
