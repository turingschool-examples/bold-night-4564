require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  before :each do
    @park_1 = AmusementPark.create!(name: 'Blips and Chitz', admission_price: 30.0)
    @mech_1 = Mechanic.create!(name: 'Todd', years_of_experience: 6)
    @ride_1 = @park_1.rides.create!(name: 'The Whirly Dirly', thrill_rating: 10, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Frankenpants', thrill_rating: 20, open: false)
    @ride_3 = @park_1.rides.create!(name: 'Vomit World', thrill_rating: 30, open: true)
    @ride_mech_1 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_1)
    @ride_mech_2 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_2)
    @ride_mech_3 = RideMechanic.create!(mechanic: @mech_1, ride: @ride_3)
  end

  it 'displays mechanic information' do
    visit "/mechanics/#{@mech_1.id}"
    expect(page).to have_content('Name: Todd')
    expect(page).to have_content('6 Years of Experience')
  end
  
  it 'displays open rides that mechanic is working on' do
    visit "/mechanics/#{@mech_1.id}"
    expect(page).to have_content('The Whirly Dirly')
    expect(page).to have_content('Thrill Rating: 10')
    expect(page).to have_content('Vomit World')
    expect(page).to have_content('Thrill Rating: 30')
  end

  it 'displays only open rides in order of thrills' do
    visit "/mechanics/#{@mech_1.id}"
    expect(page).to_not have_content('Frankenpants')

    within('#rides') do
      expect(@ride_3.name).to appear_before(@ride_1.name)
    end
  end

  it 'can add a ride to the show page' do
    visit "/mechanics/#{@mech_1.id}"
    ride_4 = @park_1.rides.create!(name: 'Wiggle Bomb', thrill_rating: 15, open: true)
    
    fill_in "Ride Id:", with: "#{ride_4.id}"
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{@mech_1.id}")
    expect(page).to have_content("Wiggle Bomb")
  end
end