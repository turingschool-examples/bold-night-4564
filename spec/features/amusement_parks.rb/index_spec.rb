require 'rails_helper'

RSpec.describe 'The amusement park index page' do
  before(:each) do
    @disney = AmusementPark.create!(name: 'Disney World', price: 125)
    @universal = AmusementPark.create!(name: 'Universal Studios', price: 110)

    @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
    @ride4 = @universal.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

    visit "/amusement_parks/"
  end

  it 'displays a link to each individual amusement park' do
    expect(page).to have_link(@disney.name)
    expect(page).to have_link(@universal.name)
  end
end
