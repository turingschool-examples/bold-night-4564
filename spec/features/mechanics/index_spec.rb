require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Dee', years_of_experience: 3)  
    @mechanic_2 = Mechanic.create!(name: 'Leon', years_of_experience: 6)  
    @mechanic_3 = Mechanic.create!(name: 'Bruce', years_of_experience: 2)  
    @mechanic_4 = Mechanic.create!(name: 'Zerry', years_of_experience: 1)  

    visit '/mechanics'
  end

  describe 'visit' do

    #     Story 1 - Mechanic Index Page

    # As a user,
    # When I visit the mechanics index page
    # I see a header saying “All Mechanics”
    # And I see a list of all mechanic’s names and their years of experience
    # And I see the average years of experience across all mechanics
    it 'Displays all Mechanics and attributes' do
      
      expect(page).to have_content('All Mechanics')
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_of_experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_of_experience)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_of_experience)
      expect(page).to have_content(@mechanic_4.name)
      expect(page).to have_content(@mechanic_4.years_of_experience)
    end
  end  
end