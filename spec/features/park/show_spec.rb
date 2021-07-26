require 'rails_helper'

RSpec.describe 'the park show page' do
  before(:each) do
    @park = Park.create(name:"Cedar Point", admission_price: 65.65)
    @ride1 = @park.rides.create(name: "Millenium Force", thrill_rating: 8, open: true)
    @ride2 = @park.rides.create(name: "Top Thrill", thrill_rating: 10, open: true)
    @ride3 = @park.rides.create(name: "Mantis", thrill_rating: 6, open: false)
    @ride4 = Ride.create(name: "Jemini", thrill_rating: 7, open: true)
    visit "/parks/#{@park.id}"
  end
  #   As a visitor,
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park
  # And I see the names of all the rides that are at that theme park listed in alphabetical order
  # And I see the average thrill rating of this amusement park’s rides
  it 'has the parks attributes' do
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.admission_price)
  end

  it 'has the names of its rides, sorted alphabetically' do
    within "div#rides" do
      #all rides from park are there
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to have_content(@ride3.name)
      #not ride 4 since it doesnt belong to park
      expect(page).to_not have_content(@ride4.name)
      #correct order
      expect(@ride3.name).to appear_before(@ride1.name)
      expect(@ride1.name).to appear_before(@ride2.name)
    end
  end

  it 'has the average thrill rating of the parks rides' do
    expect(page).to have_content("Average thrill rating of rides: 8.0/10")
  end
end