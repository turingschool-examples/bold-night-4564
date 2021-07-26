require 'rails_helper'

RSpec.describe '/mechanics/show.html.erb' do
  Mechanic.destroy_all

  let!(:jim) { Mechanic.create!(name: 'Jim', years_of_experience: 10) }
  let!(:john) { Mechanic.create!(name: 'John', years_of_experience: 5) }
  let!(:joe) { Mechanic.create!(name: 'Joe', years_of_experience: 3) }

  let!(:six_flags) do
    AmusementPark.create!(
      name: 'Six Flags',
      price: 10
    )
  end
  
  let!(:frog_hopper) do
    jim.rides.create!(
      name: "The Frog Hopper",
      thrill_rating: 4,
      open: true,
      amusement_park_id: six_flags.id
    )
  end

  let!(:fahrenheit) do
    jim.rides.create!(
      name: "Fahrenheit",
      thrill_rating: 10,
      open: true,
      amusement_park_id: six_flags.id
    )
  end

  let!(:kiss_raise) do
    jim.rides.create!(
      name: "The Kiss Raise",
      thrill_rating: 2,
      open: false,
      amusement_park_id: six_flags.id
    )
  end

  let!(:ferris_wheel) do
    Ride.create!(
      name: 'Ferris Wheel',
      thrill_rating: 1,
      open: true,
      amusement_park_id: six_flags.id
    )
  end

  let!(:open_rides) { [frog_hopper, fahrenheit] }
  let!(:closed_rides) { [kiss_raise] }

  describe 'as a user' do
    describe 'when I visit the mechanics show page' do
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

      describe 'I see a form to add a ride to their workload' do
        it 'displays the form' do
          expect(page).to have_content('Add a Ride to Workload')
          expect(page).to have_field(:ride_id)
          expect(page).to have_button('Submit')
        end

        describe 'When I fill in the form with an existing ride id and hit '\
                 'submit' do
          before do
            fill_in :ride_id, with: "#{ferris_wheel.id}"
            click_button 'Submit'
          end

          it 'returns to the mechanics show page' do
            expect(current_path).to eq("/mechanics/#{jim.id}")
          end

          it 'displays the name of the newly added ride' do
            expect(page).to have_content(ferris_wheel.name)
          end
        end
      end
    end
  end
end
