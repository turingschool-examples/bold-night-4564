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
    end

    it 'only shows rides that are open and are listed by thrill rating in descending order' do
      mechanic = create(:mechanic)
      ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
      ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true)
      ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 9, open: false)
      mechanic_ride1 = MechanicRide.create(ride_id: ride1.id, mechanic_id: mechanic.id)
      mechanic_ride2 = MechanicRide.create(ride_id: ride2.id, mechanic_id: mechanic.id)
      mechanic_ride3 = MechanicRide.create(ride_id: ride3.id, mechanic_id: mechanic.id)

      visit "/mechanics/#{mechanic.id}"

      expect(page).to_not have_content(ride3.name)
      expect(ride2.name).to appear_before(ride1.name)
    end
  end

  describe 'page on form' do
    it 'displays a form to fill in an id of an existing ride to add to the mechanic' do
      mechanic = create(:mechanic)
      ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
      ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true)
      ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 9, open: true)
      mechanic_ride1 = MechanicRide.create(ride_id: ride1.id, mechanic_id: mechanic.id)
      mechanic_ride2 = MechanicRide.create(ride_id: ride2.id, mechanic_id: mechanic.id)

      visit "/mechanics/#{mechanic.id}"
      expect(page).to_not have_content(ride3.name)

      fill_in 'ride_id', with: ride3.id
      click_on "Submit"
      save_and_open_page
      expect(current_path).to eq("/mechanics/#{mechanic.id}")
      expect(page).to have_content(ride3.name)
      expect(ride3.name).to appear_before(ride2.name)
      expect(ride2.name).to appear_before(ride1.name)
    end
  end
end
