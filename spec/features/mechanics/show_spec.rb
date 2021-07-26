require "rails_helper"

RSpec.describe 'the mechanics index' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Nick McIntyre', years_of_experience: 10)
    @ride_1 = @mechanic_1.rides.create!(name: 'The Titan', thrill_rating: 10, open: false)
    @ride_2 = @mechanic_1.rides.create!(name: 'Batman', thrill_rating: 2, open: true)
    @ride_3 = @mechanic_1.rides.create!(name: 'Superman', thrill_rating: 9, open: true)
    @ride_4 = @mechanic_1.rides.create!(name: 'WonderWoman', thrill_rating: 5, open: true)
  end

  it 'displays the mechanic attributes' do
    visit "/mechanics/#{@mechanic_1.id}"

    within("#attributes") do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_of_experience)
    end
  end

  it 'displays the mechanics rides that are open' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to_not have_content(@ride_1.name)

    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
  end

  it 'displays rides in descending order by thrill rating' do
    visit "/mechanics/#{@mechanic_1.id}"

    first = find("#ride-#{@ride_3.id}")
    mid = find("#ride-#{@ride_4.id}")
    last = find("#ride-#{@ride_2.id}")

    expect(first).to appear_before(mid)
    expect(mid).to appear_before(last)
  end
end
