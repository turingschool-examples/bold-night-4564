require 'rails_helper'

RSpec.describe "Mechanics show page" do
  before(:each) do
    @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)

    @ride_1 = Ride.create!(name: "Sky Rocket", thrill_rating: 10, open: true)
    @ride_2 = Ride.create!(name: "Splash Valley", thrill_rating: 3, open: true)
    @ride_3 = Ride.create!(name: "Tunnel Vision", thrill_rating: 6, open: false)

    @maintenance_1 = Maintenance.create!(ride: @ride_1, mechanic: @bob)
    @maintenance_2 = Maintenance.create!(ride: @ride_2, mechanic: @bob)
    @maintenance_3 = Maintenance.create!(ride: @ride_3, mechanic: @bob)
    visit "/mechanics/#{@bob.id}"
  end

  it "should link to page and display bobs attributes" do
    expect(page).to have_content("Bob's Page")
    expect(page).to have_content(12)
  end

  it "lists all the rides that they are working on and are open" do
    expect(page).to have_content("Sky Rocket")
    expect(page).to have_content("Splash Valley")
    expect(page).to_not have_content("Tunnel Vision")
  end


  it "all rides are listed by thrill rating descending order"

end
