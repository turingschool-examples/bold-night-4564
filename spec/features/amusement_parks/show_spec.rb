require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before :each do
    @amusement_park =

    @ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 1, open: true)
    @ride2 = Ride.create!(name: 'Free Fall', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'Wooden Roller Coaster', thrill_rating: 6, open: false)
    @ride4 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 7, open: true)

    visit "/amusement_parks/#{@amusement_park.id}"
  end

  xit '' do
    # I see the name and price of admissions for that amusement park
    # And I see the names of all the rides that are at that theme park listed in alphabetical order
    # And I see the average thrill rating of this amusement park’s rides
    # Ex: Hershey Park
    #    Admissions: $50.00
    #
    #    Rides:
    #           1. Lightning Racer
    #           2. Storm Runner
    #           3. The Great Bear
    #    Average Thrill Rating of Rides: 7.8/10
  end
end
