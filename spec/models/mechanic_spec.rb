require "rails_helper"

RSpec.describe Mechanic do
  describe 'associations' do
    it {should have_many :work_orders}
    it {should have_many(:rides).through(:work_orders)}
  end

  describe 'class methods' do
    describe '::average_mechanic_experience' do
      it 'returns the average years experience for all mechanics' do
        mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
        mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)
        expect(Mechanic.average_mechanic_experience).to eq(7)
      end
    end
  end

  describe 'instance methods' do
    describe '#open_rides_by_thrill_rating' do
      it 'returns the open rides for an individual mechanic' do
        mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
        mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)
        ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
        ride2 = Ride.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
        ride3 = Ride.create!(name: 'Broken Gravitron', thrill_rating: 3, open: false)
        ride4 = Ride.create!(name: 'Carousel', thrill_rating: 1, open: true)
        mechanic1.work_orders.create!(ride: ride1)
        mechanic1.work_orders.create!(ride: ride2)
        mechanic1.work_orders.create!(ride: ride3)
        mechanic2.work_orders.create!(ride: ride4)

        expected = [ride2, ride1]
        expect(mechanic1.open_rides_by_thrill_rating).to eq(expected)
      end
    end
  end
end
