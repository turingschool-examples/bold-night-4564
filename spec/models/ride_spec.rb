require "rails_helper"

RSpec.describe Ride do
  describe 'has relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'has methods' do
    before :each do
      @ride_1 = Ride.create!(
        name: 'Iron Rattler',
        thrill_rating: 8,
        open: true
      )
      @ride_2 = Ride.create!(
        name: 'The Void',
        thrill_rating: 9,
        open: true
      )
      @ride_3 = Ride.create!(
        name: 'Spunky Spin Bucket',
        thrill_rating: 4,
        open: true
      )
      @ride_4 = Ride.create!(
        name: 'Herb',
        thrill_rating: 10,
        open: false
      )
    end

    it '::order_by_thrill' do
      expect(Ride.order_by_thrill).to eq([@ride_4, @ride_2, @ride_1, @ride_3])
    end
  end
end
