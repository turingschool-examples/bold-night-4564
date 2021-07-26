require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe ':open_rides' do
      it 'returns only rides that are open or true' do
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true)
        ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 6, open: false)

        expected = [ride1, ride2]

        expect(Ride.open_rides).to eq(expected)
      end
    end
  end
end
