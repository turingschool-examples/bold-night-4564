require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it  {should have_many :maintenances}
    it  {should have_many(:rides).through(:maintenances)}
  end

  describe "class methods" do
    before(:each) do
      @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)
      @sarah = Mechanic.create!(name: "Sarah", years_of_experience: 11)
    end

    it "should show the average years experience for all mechanics" do
      expect(Mechanic.average_years_experience).to eq(11.5)
    end
  end

  describe "instance methods" do
    before(:each) do
      @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)

      @ride_1 = Ride.create!(name: "Sky Rocket", thrill_rating: 10, open: true)
      @ride_2 = Ride.create!(name: "Splash Valley", thrill_rating: 3, open: false)
      @ride_3 = Ride.create!(name: "Tunnel Vision", thrill_rating: 6, open: true)
      @ride_4 = Ride.create!(name: "Medusa", thrill_rating: 7, open: true)


      @maintenance_1 = Maintenance.create!(ride: @ride_1, mechanic: @bob)
      @maintenance_2 = Maintenance.create!(ride: @ride_2, mechanic: @bob)
      @maintenance_3 = Maintenance.create!(ride: @ride_3, mechanic: @bob)
      @maintenance_4 = Maintenance.create!(ride: @ride_4, mechanic: @bob)
    end

    it "should list rides in DESCENDING order by thrill rating" do
      expect(@bob.order_by_thrill_rating).to eq([@ride_1, @ride_4, @ride_3])
    end
  end
end
