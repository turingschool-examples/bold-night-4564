require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe ':open_rides' do
      it 'returns only rides that are open or true' do
        amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)
        ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 6, open: false, amusement_park_id: amusement_park.id)

        expected = [ride1, ride2]

        expect(Ride.open_rides).to eq(expected)
      end
    end

    describe ':order_by_thrills' do
      it 'orders rides by thrill rating in descending order' do
        amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)
        ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)

        expected = [ride2, ride3, ride1]

        expect(Ride.order_by_thrills).to eq(expected)
      end
    end

    describe ':order_by_name' do
      it 'orders rides by name in ascending order' do
        amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)
        ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)

        expected = [ride1, ride3, ride2]

        expect(Ride.order_by_name).to eq(expected)
      end
    end

    describe ':average_thrill_rating' do
      it 'returns the average thrill rating of all rides' do
        amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park_id: amusement_park.id)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)
        ride3 = Ride.create!(name: 'Merry Go Round', thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)

        expect(Ride.average_thrill_rating).to eq(6.0)
      end

      it 'will return zero if amusement park has no rides' do
        amusement_park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)

        expect(Ride.average_thrill_rating).to eq(0.0)
      end
    end
  end
end
