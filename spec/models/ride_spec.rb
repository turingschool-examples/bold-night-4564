require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
    # it { should validate_inclusion_of(:open), inclusion: [true, false] }
  end

  before :each do
    @ride1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 1, open: true)
    @ride2 = Ride.create!(name: 'Free Fall', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'Wooden Roller Coaster', thrill_rating: 6, open: false)
    @ride4 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 7, open: true)
  end

  describe 'class methods' do
    describe '.only_open' do
      it 'can display only OPEN rides' do
        expect(Ride.only_open).to eq([@ride1, @ride2, @ride4])
      end
    end

    describe '.desc_thrill' do
      it 'can display rides in descending thrill order (most thrills first)' do
        expect(Ride.desc_thrill).to eq([@ride2, @ride4, @ride3, @ride1])
      end
    end
  end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
