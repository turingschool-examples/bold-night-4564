require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Nick McIntyre', years_of_experience: 10)
    @mechanic_2 = Mechanic.create!(name: 'Lee Hopper', years_of_experience: 5)
    @mechanic_3 = Mechanic.create!(name: 'Cody Eldredge', years_of_experience: 7)
    @ride_1 = @mechanic_1.rides.create!(name: 'The Titan', thrill_rating: 10, open: false)
    @ride_2 = @mechanic_1.rides.create!(name: 'Batman', thrill_rating: 2, open: true)
    @ride_3 = @mechanic_1.rides.create!(name: 'Superman', thrill_rating: 9, open: true)
    @ride_4 = @mechanic_1.rides.create!(name: 'WonderWoman', thrill_rating: 5, open: true)
  end

  describe 'class methods' do
    describe '.average_experience' do
      it 'returns the average years of experience for all mechanics' do
        expect(Mechanic.average_experience).to eq(7.3)
      end
    end

    describe '.add_ride' do
      it 'finds mechanic and ride instance and adds ride to the mechanic' do
        new_ride = Ride.create!(name: 'Flash', thrill_rating: 8, open: true)

        expect(@mechanic_1.rides).to_not include(new_ride)

        Mechanic.add_ride(@mechanic_1.id, new_ride.id)

        updated_mechanic = Mechanic.find(@mechanic_1.id)

        expect(updated_mechanic.rides).to include(new_ride)
      end
    end
  end

  describe 'instance methods' do
    describe '.open_rides' do
      it 'returns the open rides for an instance of mechanic' do
        expect(@mechanic_1.open_rides).to eq([@ride_2, @ride_3, @ride_4])
      end
    end
  end
end
