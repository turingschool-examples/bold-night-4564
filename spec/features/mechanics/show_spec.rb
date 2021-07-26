require 'rails_helper'

RSpec.describe 'mechanic show page' do
  describe 'contents' do
    it 'displays the mechanics name, years of experience, and names of rides they are working on' do
      mechanic = create(:mechanic)
      ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
      ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true)
      mechanic_ride1 = MechanicRide.create(ride_id: ride1.id, mechanic_id: mechanic.id)
      mechanic_ride2 = MechanicRide.create(ride_id: ride2.id, mechanic_id: mechanic.id)

      visit "/mechanics/#{mechanic.id}"

      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.years_of_experience)
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)

      #     Story 2 - Mechanic Show Page
      #
      # As a user,
      # When I visit a mechanic show page
      # I see their name, years of experience, and the names of all rides they’re working on
      # And I only see rides that are open
      # And the rides are listed by thrill rating in descending order (most thrills first)
    end
  end
end
