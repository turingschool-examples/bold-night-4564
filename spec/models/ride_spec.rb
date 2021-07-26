require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  before :each do
    @amusement_park = AmusementPark.create!(name: 'Hair Metal', admission_price: 50)
    @ride_1 = Ride.create!(name: 'Twisted Sister', thrill_rating: 6, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Extreme', thrill_rating: 10, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Whitesnake', thrill_rating: 3, open: true, amusement_park_id: @amusement_park.id)
  end

  describe 'class methods' do
    describe '.open_rides' do
      it 'returns only rides that are open' do
        expect(Ride.open_rides).to eq([@ride_1, @ride_3])
      end
    end

    describe '.order_by_thrill_rating' do
      it 'can order rides by thrill rating' do
        expect(Ride.order_by_thrill_rating).to eq([@ride_2, @ride_1, @ride_3])
      end
    end
  end
end
