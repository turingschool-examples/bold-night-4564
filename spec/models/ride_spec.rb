require "rails_helper"

RSpec.describe Ride do
  describe 'associations' do
    it {should have_many :work_orders}
    it {should have_many(:mechanics).through(:work_orders)}
  end

  describe 'instance methods' do
    describe '#alphabetize' do
      it 'orders the rides alphabetically' do
        @disney = AmusementPark.create!(name: 'Disney World', price: 125)

        @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
        @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
        @ride3 = @disney.rides.create!(name: 'Bombs Away', thrill_rating: 3, open: true)
        @ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

        expected = [@ride3, @ride4, @ride1, @ride2]

        expect(@disney.rides.alphabetize).to eq(expected)
      end
    end
  end
end
