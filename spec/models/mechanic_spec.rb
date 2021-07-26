require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '::avg_years_exp' do
      it "returns the average years of experience across all mechanics" do
        mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
        mechanic2 = Mechanic.create!(name: 'Leia Organa', years_of_experience: 14)

        expect(Mechanic.avg_years_exp).to eq(13)
      end
    end
  end

  describe 'instance methods' do
    describe '#open_rides_by_thrill_desc' do
      it "returns the names of all of a mechanic's open rides, listed by thrill rating (most thrills first)" do
        mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
        ride1 = Ride.create!(name: 'Bumper Boats', thrill_rating: 6, open: true)
        ride2 = Ride.create!(name: 'Drop Tower', thrill_rating: 9, open: true)
        ride3 = Ride.create!(name: 'Bumper Cars', thrill_rating: 5, open: false)
        ride4 = Ride.create!(name: 'Pendulum Ride', thrill_rating: 8, open: true)
        mechanic1.rides << ride1
        mechanic1.rides << ride2
        mechanic1.rides << ride3

        expect(mechanic1.open_rides_by_thrill_desc).to eq([ride2, ride1])
      end
    end
  end
end
