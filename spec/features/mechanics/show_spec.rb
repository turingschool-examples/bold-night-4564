require 'rails_helper'

RSpec.describe 'Mechanics show page', type: :feature do
  before :each do
    @mechanic = Mechanic.create!(name: 'R2D2', years_of_experience: 15)

    @ride_1 = @mechanic.rides.create!(name: 'Splash Mountain', thrill_rating: 6, open: true)
    @ride_2 = @mechanic.rides.create!(name: 'Tower of Terror', thrill_rating: 10, open: false)
    @ride_3 = @mechanic.rides.create!(name: 'Its a Small World', thrill_rating: 1, open: false)
    @ride_4 = @mechanic.rides.create!(name: 'Safari Escape', thrill_rating: 5, open: true)
    @ride_5 = @mechanic.rides.create!(name: 'Space Mountain', thrill_rating: 7, open: true)
  end

  # User Story 2
  it 'displays mechanic attributes' do
    visit "/mechanics/#{@mechanic.id}"
    save_and_open_page
    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_of_experience)
  end

  it 'displays all associated, open rides' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to_not have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to have_content(@ride_5.name)
  end
end
