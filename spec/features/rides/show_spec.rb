require 'rails_helper'

RSpec.describe 'The rides show page' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)

    @disney = AmusementPark.create!(name: 'Disney World', price: 125)

    @ride1 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 4, open: true)
    @ride2 = @disney.rides.create!(name: 'Roller Coaster', thrill_rating: 10, open: true)
    @ride3 = @disney.rides.create!(name: 'Broken Gravitron', thrill_rating: 3, open: false)
    @ride4 = @disney.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)

    @mechanic1.work_orders.create!(ride: @ride1)
    @mechanic1.work_orders.create!(ride: @ride2)
    @mechanic1.work_orders.create!(ride: @ride3)
    @mechanic2.work_orders.create!(ride: @ride4)

    visit "/rides/#{@ride1.id}"
  end

  it 'displays the mechanics name, thrill rating' do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride1.thrill_rating)
  end
end
