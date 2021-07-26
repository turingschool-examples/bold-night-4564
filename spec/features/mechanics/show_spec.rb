require 'rails_helper'

RSpec.describe 'mechanics show page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Brian', years_of_experience: 8)

    @ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 1, open: true)
    @ride2 = Ride.create!(name: 'Free Fall', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'Wooden Roller Coaster', thrill_rating: 6, open: false)
    @ride4 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 7, open: true)

    @mechanic_ride1 = @mechanic1.rides << @ride1
    @mechanic_ride2 = @mechanic1.rides << @ride2
    @mechanic_ride3 = @mechanic1.rides << @ride3

    visit "/mechanics/#{@mechanic1.id}"
  end

  describe 'mechanics attributes and rides' do
    it 'can list name and years of experience of that mechanic' do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.years_of_experience)
    end

    it 'can list all the names of all OPEN rides they are working on' do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)

      expect(page).to_not have_content(@ride3.name)
      expect(page).to_not have_content(@ride4.name)
    end

    it 'lists rides by thrill rating in descending order (most thrills first)' do
      expect('Free Fall').to appear_before('Ferris Wheel')
    end
  end

  describe 'add a ride to a mechanic' do
    it 'can add an EXISTING ride to a mechanic with a form' do
      fill_in(:ride_id, with: "#{@ride4.id}")

      click_button('Add a Ride to Workload')

      expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      expect(page).to have_content(@ride4.name)
    end
  end
end
