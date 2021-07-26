require 'rails_helper'

RSpec.describe '/mechanics/show.html.erb' do
  Mechanic.destroy_all
  
  describe 'as a user' do
    describe 'when I visit the mechanics show page' do
      let!(:jim) { Mechanic.create!(name: 'Jim', years_of_experience: 10) }
      let!(:john) { Mechanic.create!(name: 'John', years_of_experience: 5) }
      let!(:joe) { Mechanic.create!(name: 'Joe', years_of_experience: 3) }

      let!(:frog_hopper) do
        jim.rides.create!(
          name: "The Frog Hopper",
          thrill_rating: 4,
          open: true,
        )
      end

      let!(:fahrenheit) do
        jim.rides.create!(
          name: "Fahrenheit",
          thrill_rating: 10,
          open: true,
        )
      end

      let!(:kiss_raise) do
        jim.rides.create!(
          name: "The Kiss Raise",
          thrill_rating: 2,
          open: false,
        )
      end

      let!(:rides) { [frog_hopper, fahrenheit, kiss_raise] }
      let!(:open_rides) { [frog_hopper, fahrenheit] }
      let!(:closed_rides) { [kiss_raise] }

      before do
        visit "/mechanics/#{jim.id}"
      end

      it 'displays their name and years of experience, and the names of all'\
         'open rides they are working on' do
        expect(page).to have_content(jim.name)
        expect(page).to have_content(jim.years_of_experience)

        open_rides.each do |ride|
          expect(page).to have_content(ride.name)
        end

        closed_rides.each do |ride|
          expect(page).to have_no_content(ride.name)
        end
      end

      it 'displays the ride names by thrill rating in descending order' do
        expect(fahrenheit.name).to appear_before(frog_hopper.name)
      end
    end
  end
end
