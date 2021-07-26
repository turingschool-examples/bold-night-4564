require "rails_helper"

RSpec.describe Park do
  describe 'relationships' do 
    it { should have_many(:rides) }
  end 

  describe 'methods' do 
    describe '.average_thrill' do 
      it 'can gice average thrill for all rides' do 
        park1 = Park.create!(name: "6Flags", price: 20)
        ride1 = Ride.create!(name: "twister", thrill: 20, open: true, park_id: park1.id)
        ride2 = Ride.create!(name: "mind-eraser", thrill: 50, open: true, park_id: park1.id)
        ride3 = Ride.create!(name: "broken carousel", thrill: 2, open: false, park_id: park1.id)
        ride4 = Ride.create!(name: "crazitown", thrill: 100, open: true, park_id: park1.id)

        expect(park1.average_thrill).to eq(43)
      end
    end 
  end
end
