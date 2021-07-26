require "rails_helper"

RSpec.describe 'the amusement park show' do
  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Six Flags', price: 50)
    @mechanic_1 = Mechanic.create!(name: 'Nick McIntyre', years_of_experience: 10)
    @ride_1 = @mechanic_1.rides.create!(name: 'The Titan', thrill_rating: 10, open: false, amusement_park_id: @amusement_park.id)
    @ride_2 = @mechanic_1.rides.create!(name: 'Batman', thrill_rating: 2, open: true, amusement_park_id: @amusement_park.id)
    @ride_3 = @mechanic_1.rides.create!(name: 'Superman', thrill_rating: 9, open: true, amusement_park_id: @amusement_park.id)
    @ride_4 = @mechanic_1.rides.create!(name: 'WonderWoman', thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
  end

  it 'displays attributes' do 
    visit "/amusement_parks/#{@amusement_park.id}"
  end
end
