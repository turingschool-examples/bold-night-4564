require "rails_helper"

RSpec.describe Ride do
  describe "relationships" do
    it {should have_many :maintenances}
    it {should have_many(:mechanics).through(:maintenances)}
  end

  it 'lists only open rides' do
    ride_1 = Ride.create!(name: 'Sidewinder', thrill_rating: 9, open: true)
    ride_2 = Ride.create!(name: 'Octothrope', thrill_rating: 7, open: true)
    ride_3 = Ride.create!(name: 'Clown Maze', thrill_rating: 2, open: false)

    expect(Ride.open_rides.length).to eq(2)
  end

end
