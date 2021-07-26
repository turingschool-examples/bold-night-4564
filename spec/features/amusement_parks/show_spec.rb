require 'rails_helper'

RSpec.describe 'The amusement park show page' do
  before(:each) do
    @disney = AmusementPark.create!(name: 'Disney World', price: 125)

    @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
    @ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
    
    visit "/amusement_parks/#{@disney.id}"
  end

  it 'displays the name and price of admission for the park' do
    expect(page).to have_content(@disney.name)
    expect(page).to have_content(@disney.price)
  end

  it 'displays all rides in alphabetical order' do
    expect(@ride3.name).to appear_before(@ride4.name)
    expect(@ride4.name).to appear_before(@ride1.name)
    expect(@ride1.name).to appear_before(@ride2.name)
  end

  it 'displays the average thrill rating of all rides in the park' do
    expect(page).to have_content("Average Thrill Rating: 4.5/10")
  end
end
