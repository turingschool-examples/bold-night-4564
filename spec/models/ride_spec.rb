require "rails_helper"

RSpec.describe Ride do
  before :each do
    @log_boat = Ride.create!(name: 'Log Boat', thrill_rating: 7, open: true)
    @tilt_a_whirl = Ride.create!(name: 'Tilt-A-Whirl', thrill_rating: 4, open: true)
    @roller_coaster = Ride.create!(name: 'Roller Coaster', thrill_rating: 9, open: true)
  end

  describe 'relationships' do
    it {should have_many :work_orders}
    it {should have_many(:mechanics).through(:work_orders)}
  end

  describe 'class methods' do
    describe '::order_by_thrill_rating' do
      it 'can list rides in order of highest thrill rating' do

        expect(Ride.order_by_thrill_rating).to eq([@roller_coaster, @log_boat, @tilt_a_whirl])
      end
    end
  end
end
