require 'rails_helper'

RSpec.describe 'Amusement Park show page' do
  before :each do
    @park_1 = AmusementPark.create!(name: 'Blips and Chitz', admission_price: 30.0)
    @ride_1 = @park_1.rides.create!(name: 'The Whirly Dirly', thrill_rating: 10, open: true)
    @ride_2 = @park_1.rides.create!(name: 'Frankenpants', thrill_rating: 20, open: false)
    @ride_3 = @park_1.rides.create!(name: 'Vomit World', thrill_rating: 30, open: true)
  end

  it 'shows name and price of admission for park' do
    visit "amusement_parks/#{@park_1.id}"
    expect(page).to have_content('Blips and Chitz')
    expect(page).to have_content('Price of admission: $30.00')
  end

  it 'shows rides in park in alphabetical order' do
    visit "amusement_parks/#{@park_1.id}"
    save_and_open_page
    within('#rides') do
      expect(@ride_2.name).to appear_before(@ride_1.name)
      expect(@ride_1.name).to appear_before(@ride_3.name)
    end
  end

  xit 'shows avg thrill rating on page' do
    visit "amusement_parks/#{@park_1.id}"
    expect(page).to have_content
  end
  # And I see the average thrill rating of this amusement park’s rides
  # Ex: Hershey Park
    #  Admissions: $50.00
  # 
    #  Rides:
            # 1. Lightning Racer
            # 2. Storm Runner
            # 3. The Great Bear
    #  Average Thrill Rating of Rides: 7.8/10
end