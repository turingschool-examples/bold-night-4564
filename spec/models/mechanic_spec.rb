require "rails_helper"

RSpec.describe Mechanic do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)

    @disney = AmusementPark.create!(name: 'Disney World', price: 125)

    @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = @disney.rides.create!(name: 'Broken Gravitron', thrill_rating: 3, open: false)
    @ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

    @mechanic1.work_orders.create!(ride: @ride1)
    @mechanic1.work_orders.create!(ride: @ride2)
    @mechanic1.work_orders.create!(ride: @ride3)
    @mechanic2.work_orders.create!(ride: @ride4)
  end

  describe 'associations' do
    it {should have_many :work_orders}
    it {should have_many(:rides).through(:work_orders)}
  end

  describe 'class methods' do
    describe '::average_mechanic_experience' do
      it 'returns the average years experience for all mechanics' do
        expect(Mechanic.average_mechanic_experience).to eq(7)
      end
    end
  end

  describe 'instance methods' do
    describe '#open_rides_by_thrill_rating' do
      it 'returns the open rides for an individual mechanic' do
        expected = [@ride2, @ride1]
        
        expect(@mechanic1.open_rides_by_thrill_rating).to eq(expected)
      end
    end
  end
end
