require 'rails_helper'

RSpec.describe 'Mechanic Show' do
  before(:each) do
    @mechanic = Mechanic.create!(name: 'Dee', years_of_experience: 4)  
    
    @ride_1 = @mechanic.rides.create!(name: 'Whiplash', thrill_rating: 8, open: true)
    @ride_2 = @mechanic.rides.create!(name: 'Tea Cups', thrill_rating: 10, open: false)
    @ride_3 = @mechanic.rides.create!(name: 'Halfpipe', thrill_rating: 6, open: true)
    @ride_4 = Ride.create!(name: 'Superman', thrill_rating: 7, open: true)

    visit "/mechanics/#{@mechanic.id}"
  end

  describe 'visit' do
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
    
      #     Story 3 - Add a Ride to a Mechanic

      # As a user,
      # When I go to a mechanics show page
      # I see a form to add a ride to their workload
      # When I fill in that field with an id of an existing ride and hit submit
      # I’m taken back to that mechanic's show page
      # And I see the name of that newly added ride on this mechanics show page

      # Ex:
      # Mechanic: Kara Smith
      # Years of Experience: 11

      # Current rides they’re working on:
      # The Frog Hopper
      # Fahrenheit
      # The Kiss Raise

      # Add a ride to workload:
      # Ride Id: _pretend_this_is_a_textfield_
      # Submit
    it 'has a form to add rides to a mechanic' do
      
      expect(page).to_not have_content(@ride_4.name)

      fill_in 'ride_id', with: @ride_4.id
      click_on('Submit')

      expect(current_path).to eq("/mechanics/#{@mechanic.id}")
      
      expect(page).to have_content(@ride_4.name)
    end
  end  
end