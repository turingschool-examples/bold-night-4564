require 'rails_helper'

RSpec.describe 'The mechanics index page' do
  before(:each) do
    @disney = AmusementPark.create!(name: 'Disney World', price: 125)
    @universal = AmusementPark.create!(name: 'Universal Studios', price: 110)

    @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
    @ride4 = @universal.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
    visit '/rides'
  end

  it 'has a header saying all rides' do
    expect(page).to have_content("All Rides")
  end

  it 'has a list of all ride names and thrill rating' do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to have_content(@ride4.name)
    expect(page).to have_content(@ride1.thrill_rating)
    expect(page).to have_content(@ride2.thrill_rating)
    expect(page).to have_content(@ride3.thrill_rating)
    expect(page).to have_content(@ride4.thrill_rating)
  end

end
