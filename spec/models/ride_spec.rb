require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many(:maintenances)}  
    it {should have_many(:mechanics).through(:maintenances)}  
  end

  before(:each) do
    @mechanic = Mechanic.create!(name: 'Dee', years_of_experience: 4)  
    
    @ride_1 = @mechanic.rides.create!(name: 'Whiplash', thrill_rating: 8, open: true)
    @ride_2 = @mechanic.rides.create!(name: 'Tea Cups', thrill_rating: 10, open: false)
    @ride_3 = @mechanic.rides.create!(name: 'Halfpipe', thrill_rating: 6, open: true)
  end

  describe 'class methods' do
    it 'displays rides that are open in order' do

      expect(Ride.open_thrill).to eq([@ride_1, @ride_3])
    end  
  end
end