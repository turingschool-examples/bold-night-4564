require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  before(:each) do
    @ride_1 = Ride.create!(name: 'The Titan', thrill_rating: 10, open: false)
    @ride_2 = Ride.create!(name: 'Batman', thrill_rating: 2, open: true)
    @ride_3 = Ride.create!(name: 'Superman', thrill_rating: 9, open: true)
    @ride_4 = Ride.create!(name: 'WonderWoman', thrill_rating: 5, open: true)
  end

  describe 'class methods' do
    describe '.order_by_thrill' do
      it 'orders the rides by their thrill rating in descending order' do
        expect(Ride.order_by_thrill).to eq([@ride_1, @ride_3, @ride_4, @ride_2])
      end
    end
  end
end
