require "rails_helper"

RSpec.describe Mechanic do

  describe 'Relationships' do
  it { should have_many :ride_mechanics}
  it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: 'Robert', years_of_experience: 27)
      @mechanic_2 = Mechanic.create!(name: 'Brian', years_of_experience: 20)
      @mechanic_3 = Mechanic.create!(name: 'Rachel', years_of_experience: 23)
      @mechanic_4 = Mechanic.create!(name: 'Holly', years_of_experience: 15)
      @mechanic_5 = Mechanic.create!(name: 'Mason', years_of_experience: 18)
    end
    #user story 1
    describe '::avg_years_of_experience' do
      it 'returns the average years of experience for all mechanics' do
        expect(Mechanic.avg_years_of_experience).to eq(20.6)
      end
    end
  end

  describe 'instance methods' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: 'Robert', years_of_experience: 27)

      @ride_1 = Ride.create!(name: 'Big Thunder', thrill_rating: 8, open: true)
      @ride_2 = Ride.create!(name: 'Mine Train', thrill_rating: 2, open: true)
      @ride_3 = Ride.create!(name: 'Space Mountain', thrill_rating: 7, open: false)
      @ride_4 = Ride.create!(name: 'The Barnstormer', thrill_rating: 9, open: true)
      @ride_5 = Ride.create!(name: 'Wildlife Express', thrill_rating: 5, open: false)
      @ride_6 = Ride.create!(name: 'Laugh Floor', thrill_rating: 6, open: true)

      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_1)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_2)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_3)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_4)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_5)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_6)
    end
    #user story 2
    describe '#open_rides_desc_by_thrill_rating' do
      it 'returns rides open for the mechanic in desc order by thrill rating' do
        expect(@mechanic_1.open_rides_desc_by_thrill_rating).to eq([@ride_4, @ride_1, @ride_6, @ride_2])
      end
    end
  end
end
