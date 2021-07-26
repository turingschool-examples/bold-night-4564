require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'can find the average years of experence of all mechanics' do
      mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 12)
      mech2 = Mechanic.create!(name: 'Willa Wotkyns', years_of_experience: 8)
      mech3 = Mechanic.create!(name: 'Joe Dirt', years_of_experience: 14)

      expect(Mechanic.average_years_experience).to eq(11)
    end
  end

    describe 'instance methods' do
      it 'can list open rides mechanic is working on' do
        mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 10)
        six_flags = AmusementPark.create!(name: 'Six Flags', admission: 50)
        ride1 = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
        ride2 = six_flags.rides.create!(name: 'Kamikaze', thrill_rating: 10, open: true)
        ride3 = six_flags.rides.create!(name: 'Swings', thrill_rating: 5, open: false)
        ride4 = six_flags.rides.create!(name: 'Pirate Ship', thrill_rating: 8, open: true)
        MechanicRide.create!(mechanic: mech1, ride: ride1)
        MechanicRide.create!(mechanic: mech1, ride: ride2)
        MechanicRide.create!(mechanic: mech1, ride: ride3)
        MechanicRide.create!(mechanic: mech1, ride: ride4)

        expect(mech1.open_rides_working_on.length).to eq(3)
        expect(mech1.open_rides_working_on).to eq([ride1, ride2, ride4])
      end

      it 'can list open rides mechanic is working on in descending order by thrill rating' do
        mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 10)
        six_flags = AmusementPark.create!(name: 'Six Flags', admission: 50)
        ride1 = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
        ride2 = six_flags.rides.create!(name: 'Kamikaze', thrill_rating: 10, open: true)
        ride3 = six_flags.rides.create!(name: 'Swings', thrill_rating: 5, open: false)
        ride4 = six_flags.rides.create!(name: 'Pirate Ship', thrill_rating: 8, open: true)
        MechanicRide.create!(mechanic: mech1, ride: ride1)
        MechanicRide.create!(mechanic: mech1, ride: ride2)
        MechanicRide.create!(mechanic: mech1, ride: ride3)
        MechanicRide.create!(mechanic: mech1, ride: ride4)

        expect(mech1.open_rides_by_thrill).to eq([ride2, ride4, ride1])
      end
    end
  end
