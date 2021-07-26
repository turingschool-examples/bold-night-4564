require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Gertrude Robinson', years_of_experience: 50)
    @mechanic2 = Mechanic.create!(name: 'Jonathan Sims', years_of_experience: 6)
    @mechanics = Mechanic.all
  end
  
  # Story 1 - Mechanic Index Page
  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  describe 'as a user' do
    describe 'when i visit the mechanics index page' do
      it 'can see a header displaying All Mechanics' do
        visit '/mechanics'

        expect(page).to have_content('All Mechanics')
      end

      it 'can see a list of the mechanics names' do
        visit '/mechanics'

        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic2.name)
      end

      it 'can see a list of the mechanics years of experience' do
        visit '/mechanics'

        expect(page).to have_content(@mechanic1.years_of_experience)
        expect(page).to have_content(@mechanic2.years_of_experience)
      end

      it 'can see the average years of experience for all mechanics' do
        visit '/mechanics'

        expect(page).to have_content(@mechanics.average("years_of_experience"))
      end
    end
  end
end
