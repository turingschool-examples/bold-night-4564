require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do 
    it { should have_many(:maintenences) }
    it { should have_many(:rides).through(:maintenences) }
  end 

  describe 'methods' do 
    describe '::average_years' do 
      it 'can average all the years of mechanics expo' do 
        mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
        mechanic2 = Mechanic.create!(name: "John", years_of_experience: 12)
        mechanic3 = Mechanic.create!(name: "Julie", years_of_experience: 14)
        mechanic4 = Mechanic.create!(name: "James", years_of_experience: 16)

        expect(Mechanic.average_years).to eq(13)
      end 
    end

    describe '.open_rides' do 
      it 'can order all rides currently being worked on ordered by thrill rating' do 
        park1 = Park.create!(name: "6Flags", price: 20)
        mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
        ride1 = Ride.create!(name: "twister", thrill: 20, open: true, park_id: park1.id)
        ride2 = Ride.create!(name: "mind-eraser", thrill: 50, open: true, park_id: park1.id)
        ride3 = Ride.create!(name: "broken carousel", thrill: 2, open: false, park_id: park1.id)
        ride4 = Ride.create!(name: "crazitown", thrill: 100, open: true, park_id: park1.id)
        Maintenence.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
        Maintenence.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
        Maintenence.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)

        expect(mechanic1.open_rides).to eq([ride2, ride1])
      end
    end 
  end
end
