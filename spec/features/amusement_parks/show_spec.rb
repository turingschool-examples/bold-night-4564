require 'rails_helper'

RSpec.describe '/amusement_parks/show.html.erb' do
  let!(:six_flags) { AmusementPark.create!(name: 'Six Flags',price: 10) }

  let!(:frog_hopper) do
    six_flags.rides.create!(
      name: "The Frog Hopper",
      thrill_rating: 4,
      open: true
    )
  end

  let!(:fahrenheit) do
    six_flags.rides.create!(
      name: "Fahrenheit",
      thrill_rating: 10,
      open: true
    )
  end

  let!(:kiss_raise) do
    six_flags.rides.create!(
      name: "The Kiss Raise",
      thrill_rating: 2,
      open: false
    )
  end

  let!(:rides) { [frog_hopper, fahrenheit, kiss_raise] }

  describe 'as a visitor' do
    describe 'when I visit an amusement parks show page' do
      before do
        visit "/amusement_parks/#{six_flags.id}"
      end

      it 'displays the name and price of the amusement park' do
        expect(page).to have_content(six_flags.name)
        expect(page).to have_content("$10.00")
      end

      it 'displays the names of all the rides in alphabetical order' do
        rides.each do |ride|
          expect(page).to have_content(ride.name)
        end

        expect(fahrenheit.name).to appear_before(frog_hopper.name)
        expect(frog_hopper.name).to appear_before(kiss_raise.name)
      end

      it 'displays the average thrill rating of the rides' do
        expect(page).to have_content(
          "Average Thrill Rating of Rides: "\
          "#{six_flags.rides.average_thrill_rating}/10"
        )
      end
    end
  end
end
