require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  let!(:frog_hopper) do
    Ride.create!(
      name: "The Frog Hopper",
      thrill_rating: 4,
      open: true,
    )
  end

  let!(:fahrenheit) do
    Ride.create!(
      name: "Fahrenheit",
      thrill_rating: 10,
      open: true,
    )
  end

  let!(:kiss_raise) do
    Ride.create!(
      name: "The Kiss Raise",
      thrill_rating: 2,
      open: false,
    )
  end

  let!(:rides) { [frog_hopper, fahrenheit, kiss_raise] }
  let!(:open_rides) { [frog_hopper, fahrenheit] }
  let!(:closed_rides) { [kiss_raise] }

  describe 'class methods' do
    describe '.open' do
      it 'returns all the open rides' do
        expect(Ride.open).to eq(open_rides)
      end
    end

    describe '.order_by_most_thrilling' do
      it 'orders the rides by most thrilling' do
        expected = [fahrenheit, frog_hopper, kiss_raise]
        expect(Ride.order_by_most_thrilling).to eq(expected)
      end
    end
  end
end
