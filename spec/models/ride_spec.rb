require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:mech_rides) }
    it { should have_many(:mechanics) }
  end
  describe 'class methods' do
    before(:each) do    
      @jim = Mechanic.create(name:'Jim Bob', years_of_experience: 2)
      @sue = Mechanic.create(name:'Sue', years_of_experience: 3)
      @tim = Mechanic.create(name:'Tim Bob', years_of_experience: 5)
      @tony = Mechanic.create(name:'Tony Saprano', years_of_experience: 6)
  
      @ride1 = @jim.rides.create(name: "Millenium Force", thrill_rating: 8, open: true)
      @ride2 = @jim.rides.create(name: "Top Thrill", thrill_rating: 10, open: true)
      @ride3 = @jim.rides.create(name: "Mantis", thrill_rating: 6, open: false)
      @ride4 = Ride.create(name: "Jemini", thrill_rating: 7, open: true)

    end

    describe 'sort_by_thrill' do
      it 'sorts rides by thrill thrill_rating' do
        expect(Ride.sort_by_thrill).to eq([@ride2, @ride1, @ride4, @ride3])
      end
    end
    describe 'is_open' do
      it 'returns only rides that are open' do
        expect(Ride.is_open).to eq([@ride1, @ride2, @ride4])
      end
    end
  end
  describe 'instance methods' do

  end
end