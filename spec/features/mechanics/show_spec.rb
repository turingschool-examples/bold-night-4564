require 'rails_helper'

RSpec.describe 'Mechanics show page', type: :feature do
  before :each do
    @mechanic = Mechanic.create!(name: 'R2D2', years_of_experience: 15)

    @ride_1 = Ride.create!(name: 'Splash Mountain', thrill_rating: 6, open: true)
    @ride_2 = Ride.create!(name: 'Tower of Terror', thrill_rating: 10, open: false)
    @ride_3 = Ride.create!(name: 'Its a Small World', thrill_rating: 1, open: false)
    @ride_4 = Ride.create!(name: 'Safari Escape', thrill_rating: 5, open: true)
    @ride_5 = Ride.create!(name: 'Space Mountain', thrill_rating: 7, open: true)
  end

  # User Story 2
  it 'displays mechanic attributes' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_of_experience)
  end

   # User Story 2
  it 'displays all associated, open rides' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to_not have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to have_content(@ride_5.name)
  end

  # User Story 2
  it 'orders open rides in descending order of thrill rating' do
    visit "/mechanics/#{@mechanic.id}"

    expect(@ride_5.name).to appear_before(@ride_1.name)
    expect(@ride_1.name).to appear_before(@ride_4.name)
  end

  # User Story 3
  it 'renders a form to add an existing ride by id' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content("Ride ID:")
    expect(page).to have_button("Add Ride")

    @ride_6 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 4, open: true)
    fill_in :search, with: "#{@ride_6.id}"
    click_button "Add Ride"

    expect(page).to have_content(@ride_6.name)
    expect(@ride_6.name).to_not appear_before(@ride_4.name)
    expect(@ride_6.name).to appear_before("Add ride to credentials")
  end

  # User Story 3
  it 'orders new ride appropriately' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content("Ride ID:")
    expect(page).to have_button("Add Ride")

    @ride_6 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 10, open: true)
    fill_in :search, with: "#{@ride_6.id}"
    click_button "Add Ride"

    expect(page).to have_content(@ride_6.name)
    expect(@ride_6.name).to appear_before(@ride_5.name)
    expect(@ride_6.name).to appear_before(@ride_1.name)
  end
end
