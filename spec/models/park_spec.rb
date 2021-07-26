require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it {should have_many :rides}
    end

    describe 'instance methods' do
      describe 'average_thrill_rating' do
        it 'can avergage the thrill rating for all rides' do
          park_1 = Park.create!(name: 'Sunny Vale', admission: 10)

          ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true, park_id: park_1.id)
          ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true, park_id: park_1.id)
          ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false, park_id: park_1.id)

          expect(park_1.average_thrill_rating).to eq(6)
        end
      end
    end
  end
