require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do
  describe 'visitor' do
    let(:this) {'Twister'}
    let(:that) {'Choo Choo'}

    it 'displays a mechanics attributes and their assignments' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)

      ride1 = Ride.create!(name: 'Twister', thrill_rating: 4, open: true)
      ride2 = Ride.create!(name: 'Loopy', thrill_rating: 6, open: false)
      ride3= Ride.create!(name: 'Choo Choo', thrill_rating: 2, open: true)

      lily.rides << [ride1, ride2, ride3]

      visit "/mechanics/#{lily.id}"

      expect(page).to have_content('Lily')
      expect(page).to have_content('10')

      expect(page).to have_content('Ride Assignments')

      expect(this).to appear_before(that)
      expect(page).to_not have_content('Loopy')
    end

    it 'can add new ride to assignments' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)

      ride1 = Ride.create!(name: 'Twister', thrill_rating: 4, open: true)
      ride2 = Ride.create!(name: 'Loopy', thrill_rating: 6, open: false)
      ride3= Ride.create!(name: 'Choo Choo', thrill_rating: 2, open: true)
      ride4= Ride.create!(name: 'Bolt', thrill_rating: 7, open: true)

      lily.rides << [ride1, ride2, ride3]

      visit "/mechanics/#{lily.id}"

      fill_in(:ride_id, with: ride4.id)
      click_on('Submit')

      expect(current_path).to eq("/mechanics/#{lily.id}")

      expect(page).to have_content('Bolt')
    end
  end
end
