require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:rides).through(:assignments)}
  end

  describe 'Class methods' do
    it 'can calculate average years' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)
      mike = Mechanic.create!(name: 'Mike', years_of_experience: 8)

      expect(Mechanic.average_years).to eq(9)
    end
  end

  describe 'instance methods' do
    it 'retrieves open rides in thrill order' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)

      ride1 = Ride.create!(name: 'Twister', thrill_rating: 4, open: true)
      ride2 = Ride.create!(name: 'Loopy', thrill_rating: 6, open: false)
      ride3= Ride.create!(name: 'Choo Choo', thrill_rating: 2, open: true)
      ride4= Ride.create!(name: 'Bolt', thrill_rating: 7, open: true)

      lily.rides << [ride1, ride2, ride3, ride4]

      expect(lily.open_rides).to eq([ride4, ride1, ride3])
    end
  end
end
