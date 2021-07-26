require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :maintenences}
    it {should have_many(:rides).through(:maintenences)}
  end

  describe 'class methods'do
    it 'can average years_of_experience' do
      mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
      mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)
      mech_3 = Mechanic.create!(name: 'Julian', years_of_experience: 10)

      expect(Mechanic.average_experience).to eq(8)
    end
  end

  describe 'instance methods' do
    it 'shows open rides being worked on' do
      park_1 = Park.create!(name: 'Sunny Vale', admission: 10)
      mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
      mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)

      ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true, park_id: park_1.id)
      ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true, park_id: park_1.id)
      ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false, park_id: park_1.id)


      maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
      maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)
      maint_3 = Maintenence.create!(mechanic: mech_1, ride: ride_3)

      expect(mech_1.working_open_rides).to eq([ride_1, ride_2])
    end

    it 'lists open rides in descending order' do
      park_1 = Park.create!(name: 'Sunny Vale', admission: 10)
      mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
      mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)

      ride_1 = Ride.create!(name: "Steve French", thrill_rating: 5, open: true, park_id: park_1.id)
      ride_2 = Ride.create!(name: "Z-town", thrill_rating: 9, open: true, park_id: park_1.id)
      ride_3 = Ride.create!(name: "Creek", thrill_rating: 6, open: false, park_id: park_1.id)


      maint_1 = Maintenence.create!(mechanic: mech_1, ride: ride_1)
      maint_2 = Maintenence.create!(mechanic: mech_1, ride: ride_2)
      maint_3 = Maintenence.create!(mechanic: mech_1, ride: ride_3)

      expect(mech_1.order_by_open_thrill).to eq([ride_2, ride_1])
    end
  end
end
