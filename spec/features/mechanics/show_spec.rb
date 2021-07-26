require 'rails_helper'

RSpec.describe 'Mechanic Show' do
  before(:each) do
    @mechanic = Mechanic.create!(name: 'Dee', years_of_experience: 4)  
    
    @ride_1 = @mechanic.rides.create!(name: 'Whiplash', thrill_rating: 8, open: true)
    @ride_2 = @mechanic.rides.create!(name: 'Tea Cups', thrill_rating: 10, open: false)
    @ride_3 = @mechanic.rides.create!(name: 'Halfpipe', thrill_rating: 6, open: true)

    visit "/mechanics/#{@mechanic.id}"
  end

  describe 'visit' do
    #     Story 2 - Mechanic Show Page

    # As a user,
    # When I visit a mechanic show page
    # I see their name, years of experience, and the names of all rides they’re working on
    # And I only see rides that are open
    # And the rides are listed by thrill rating in descending order (most thrills first)  
    it 'displays a mechanics an the attributes' do
      
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_of_experience)

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
    end   

    it 'displays rides that are open in order of Thrill rating' do
      within('#thrill') do
        expect(@ride_1.name).to appear_before(@ride_3.name)  
        expect(page).to_not have_content(@ride_2.name) 
      end
    end
  end  
end