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
      expect(page).to have_content("1. #{ride1.name}")
      expect(page).to have_content("2. #{ride3.name}")
      expect(page).to have_content("3. #{ride2.name}")
    end

    it 'displays the average thrill rating of the rides at the park' do
      amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
      ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
      ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)
      ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 9, open: false, amusement_park_id: amusement_park.id)

      visit "/amusementparks/#{amusement_park.id}"
      rides = amusement_park.rides

      expect(page).to have_content("Average Thrill Rating of Rides: #{rides.average_thrill_rating}/10")
    end
  end
end
