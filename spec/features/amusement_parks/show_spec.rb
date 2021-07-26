require 'rails_helper'

RSpec.describe 'amusement park show page' do
  describe 'contents' do
    it 'displays the name and admission price for the park' do
      amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)

      visit "/amusementparks/#{amusement_park.id}"

      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content("Admission Price: $#{amusement_park.admission_price}.00")
    end

    it 'displays all rides at the park in alphabetical order' do
      amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
      ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
      ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)
      ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 9, open: false, amusement_park_id: amusement_park.id)

      visit "/amusementparks/#{amusement_park.id}"

      expect(ride1.name).to appear_before(ride3.name)
      expect(ride3.name).to appear_before(ride2.name)
# As a visitor,
# When I visit an amusement park’s show page
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
#
# Note: You may have to make new migrations for this story

    end
  end
end
