require 'rails_helper'

RSpec.describe 'The Mecahanic Show page' do
  before :each do
    @tom = Mechanic.create!(name: "Tom", years_of_experience: 6)
    @john = Mechanic.create!(name: "John", years_of_experience: 4)

    @log_boat = Ride.create!(name: 'Log Boat', thrill_rating: 7, open: true)
    @tea_cup = Ride.create!(name: 'Tea Cup', thrill_rating: 2, open: false)
    @tilt_a_whirl = Ride.create!(name: 'Tilt-A-Whirl', thrill_rating: 4, open: true)
    @roller_coaster = Ride.create!(name: 'Roller Coaster', thrill_rating: 9, open: true)
    @carousel = Ride.create!(name: 'Carousel', thrill_rating: 3, open: true)

    WorkOrder.create!(mechanic: @tom, ride: @log_boat)
    WorkOrder.create!(mechanic: @tom, ride: @tea_cup)
    WorkOrder.create!(mechanic: @tom, ride: @tilt_a_whirl)
    WorkOrder.create!(mechanic: @tom, ride: @roller_coaster)

    visit "/mechanics/#{@tom.id}"
  end

# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

  it 'can show the attributes of a mechanic' do

    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@tom.years_of_experience)
    expect(page).to_not have_content(@john.name)
  end

  it 'can show the OPEN rides the mechanic is working on' do

    expect(page).to have_content('Work Orders for Open Rides:')
    expect(page).to have_content(@log_boat.name)
    expect(page).to have_content(@log_boat.thrill_rating)
    expect(page).to have_content(@tilt_a_whirl.name)
    expect(page).to have_content(@tilt_a_whirl.thrill_rating)
    expect(page).to have_content(@roller_coaster.name)
    expect(page).to have_content(@roller_coaster.name)
    expect(page).to_not have_content(@tea_cup.name)
  end

  it 'can display the rides in order of highest thrill rating' do

    expect(@roller_coaster.name).to appear_before(@log_boat.name)
    expect(@log_boat.name).to appear_before(@tilt_a_whirl.name)
  end

# Story 3 - Add a Ride to a Mechanic
#
# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page

  it 'has a form to add a new ride to their workload that redirects back to show page and displays the new ride' do

    expect(page).to have_content('Add a Ride to Workload:')

    fill_in :ride_id, with: "#{@carousel.id}"

    click_button 'Submit'

    expect(current_path).to eq("/mechanics/#{@tom.id}")
    expect(page).to have_content(@carousel.name)
  end
end
