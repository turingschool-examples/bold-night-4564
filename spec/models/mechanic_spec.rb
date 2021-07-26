require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:maintenances) }
    it { should have_many(:rides).through(:maintenances) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end

  before :each do
    @amusement_park1 = AmusementPark.create!(name: "Elitches", price_of_admission: 50)
    @amusement_park2 = AmusementPark.create!(name: "Lake Side", price_of_admission: 30)
  
    @ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true, amusement_parks_id: @amusement_park1.id)
    @ride2 = Ride.create!(name: "Side Winder", thrill_rating: 4, open: true, amusement_parks_id: @amusement_park1.id)
    @ride3 = Ride.create!(name: "Tower O Doom", thrill_rating: 10, open: true, amusement_parks_id: @amusement_park1.id)
    @ride4 = Ride.create!(name: "Shake Rattle and Roll", thrill_rating: 1, open: false, amusement_parks_id: @amusement_park1.id)
    @ride5 = Ride.create!(name: "Twister 2 ", thrill_rating: 9, open: true, amusement_parks_id: @amusement_park1.id)

    @mechanic1 = Mechanic.create!(name: "Bob", years_of_experience: 7)
    @mechanic2 = Mechanic.create!(name: "Jim", years_of_experience: 1)
    @mechanic3 = Mechanic.create!(name: "Clyde", years_of_experience: 3)
    @mechanic4 = Mechanic.create!(name: "Charles", years_of_experience: 10)

    @maintenance1 = Maintenance.create!(mechanic_id: @mechanic4.id, ride_id: @ride4.id)
    @maintenance2 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride4.id)
    @maintenance3 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride3.id)
    @maintenance4 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride3.id)
    @maintenance5 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride2.id)
    @maintenance6 = Maintenance.create!(mechanic_id: @mechanic3.id, ride_id: @ride1.id)
    @maintenance7 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
    @maintenance8 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride2.id)
  end

  describe 'class methods' do
   describe '.average_work' do
      it 'can determien the average of the years ecperience column' do
        expect(Mechanic.average_work).to eq(5.25)
      end
    end
  end

  describe 'instance methods' do
    describe '#rank_open_rides' do
      it 'can list all the open rides from most thrills to the least' do
        expect(@mechanic1.rank_open_rides).to eq([@ride3, @ride1, @ride2])
      end
    end
  end
end