require 'rails_helper'

RSpec.describe 'The Mechanic show page' do
  describe 'Story 2' do
    # As a user,
    # When I visit a mechanic show page
    # I see their name, years of experience, and the names of all rides they’re working on
    # And I only see rides that are open
    # And the rides are listed by thrill rating in descending order (most thrills first)

    it "displays the mechanic's name, years of experience" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
      mechanic2 = Mechanic.create!(name: 'Leia Organa', years_of_experience: 14)

      visit "/mechanics/#{mechanic1.id}"

      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_of_experience)
      expect(page).to_not have_content(mechanic2.name)
      expect(page).to_not have_content(mechanic2.years_of_experience)
    end

    it "displays the names of all the open rides they're working on, listed by thrill rating (most thrills first)" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
      ride1 = Ride.create!(name: 'Bumper Boats', thrill_rating: 6, open: true)
      ride2 = Ride.create!(name: 'Drop Tower', thrill_rating: 9, open: true)
      ride3 = Ride.create!(name: 'Bumper Cars', thrill_rating: 5, open: false)
      ride4 = Ride.create!(name: 'Pendulum Ride', thrill_rating: 8, open: true)
      mechanic1.rides << ride1
      mechanic1.rides << ride2
      mechanic1.rides << ride3

      visit "/mechanics/#{mechanic1.id}"

      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to_not have_content(ride3.name)
      expect(page).to_not have_content(ride4.name)
      expect(ride2.name).to appear_before(ride1.name)
    end
  end

  describe 'Story 3 - Add a ride to a Mechanic' do
  # As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page

    it "displays a section to add a ride to their workload" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)

      visit "/mechanics/#{mechanic1.id}"

      expect(page).to have_content('Add a ride to workload:')
      fill_in :ride_id, with: 5
    end

    it "accepts an id of an existing ride; on submit the mechanic's show page displays the newly added ride" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
      ride1 = Ride.create!(name: 'Bumper Boats', thrill_rating: 6, open: true)
      ride2 = Ride.create!(name: 'Drop Tower', thrill_rating: 9, open: true)
      ride3 = Ride.create!(name: 'Bumper Cars', thrill_rating: 5, open: false)
      ride4 = Ride.create!(name: 'Pendulum Ride', thrill_rating: 8, open: true)
      mechanic1.rides << ride1
      mechanic1.rides << ride2
      mechanic1.rides << ride3

      visit "/mechanics/#{mechanic1.id}"

      expect(page).to_not have_content(ride4.name)

      fill_in :ride_id, with: ride4.id
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{mechanic1.id}")
      expect(page).to have_content(ride4.name)
    end
  end
end
