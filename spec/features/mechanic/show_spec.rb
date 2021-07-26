require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Gertrude Robinson', years_of_experience: 50)
    @mechanic2 = Mechanic.create!(name: 'Jonathan Sims', years_of_experience: 6)
    @mechanics = Mechanic.all
    @ride1 = Ride.create!(name: 'The Web', thrill_rating: 8, open: true)
    @ride2 = Ride.create!(name: 'The Eye', thrill_rating: 2, open: true)
    @ride3 = Ride.create!(name: 'The Flesh', thrill_rating: 4, open: true)
    @ride4 = Ride.create!(name: 'The Dark', thrill_rating: 10, open: false)
  end

  # Story 2 - Mechanic Show Page
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)
  describe 'as a user' do
    describe 'when i visit the mechanics show page' do
      it 'can see that mechanics attributes' do
        visit "/mechanics/#{@mechanic1.id}"

        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic1.years_of_experience)
        expect(page).to_not have_content(@mechanic2.name)
        expect(page).to_not have_content(@mechanic2.years_of_experience)
      end

      xit 'can see the names of all rides the mechanic is working on' do
        visit '/mechanics/:id'
      end

      xit 'can only see rides that are open' do
        visit '/mechanics/:id'
      end

      xit 'can see rides listed in descending order of thrill_rating' do
        visit '/mechanics/:id'
      end
    end
  end
end
