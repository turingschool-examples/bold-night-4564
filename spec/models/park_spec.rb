require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    describe '#rides_by_name' do
      it 'returns the rides that are at that theme park listed in alphabetical order' do
        park = Park.create!(name: 'Six Flags', price: 10)
        ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
        ride_2 = park.rides.create!(name: 'Carousel', thrill_rating: 3, open: true)
        ride_3 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)

        expect(park.rides_by_name).to eq([ride_2, ride_1 ,ride_3])
      end
    end

    describe '#average_thrill_rating' do
      it 'returns the average thrill rating of this amusement parks rides' do
        park = Park.create!(name: 'Six Flags', price: 10)
        ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
        ride_2 = park.rides.create!(name: 'Carousel', thrill_rating: 3, open: true)
        ride_3 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)

        expect(park.average_thrill_rating).to eq(6)
      end
    end
  end
end
