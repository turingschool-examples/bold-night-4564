require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:workloads) }
    it { should have_many(:rides).through(:workloads) }
  end

  describe 'class methods' do
    describe '::average_mechanic_experience' do
      it 'returns the average years experience for all mechanics' do
        mechanic_1 = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
        mechanic_2 = Mechanic.create!(name: 'Kelly M', years_of_experience: 6)

        expect(Mechanic.average_mechanic_experience).to eq(8)
      end
    end
  end

  describe 'instance methods' do
    describe '#open_rides_by_thrill_rating' do
      it 'returns the mechanics open rides ordered by thrill rating (descending)' do
        mechanic = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
        park = Park.create!(name: 'Six Flags', price: 10)
        ride_1 = park.rides.create!(name: 'Ferris Wheel', thrill_rating: 5, open: true)
        ride_2 = park.rides.create!(name: 'Busted Ferris Wheel', thrill_rating: 5, open: false)
        ride_3 = park.rides.create!(name: 'Carousel', thrill_rating: 2, open: true)
        ride_4 = park.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
        Workload.create!(ride: ride_1, mechanic: mechanic)
        Workload.create!(ride: ride_2, mechanic: mechanic)
        Workload.create!(ride: ride_4, mechanic: mechanic)

        expect(mechanic.open_rides_by_thrill_rating).to eq([ride_4, ride_1])
      end
    end
  end
end
