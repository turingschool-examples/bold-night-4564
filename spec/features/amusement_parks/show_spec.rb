require 'rails_helper'

RSpec.describe 'Amusement Park show page' do
  xit 'shows name and price of admission for park' do
    visit "amusement_parks/#{@park_1.id}"

  end
  # As a visitor,
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park

  xit 'shows rides in park in alphabetical order' do
    visit "amusement_parks/#{@park_1.id}"
  end
  # And I see the names of all the rides that are at that theme park listed in alphabetical order

  xit 'shows avg thrill rating on page' do
    visit "amusement_parks/#{@park_1.id}"
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