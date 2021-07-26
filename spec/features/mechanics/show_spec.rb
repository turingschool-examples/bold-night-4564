require 'rails_helper'

RSpec.describe 'the amechanics index page' do
  before(:each) do
    @jim = Mechanic.create(name:'Jim Bob', years_of_experience: 2)
    @sue = Mechanic.create(name:'Sue', years_of_experience: 3)
    @tim = Mechanic.create(name:'Tim Bob', years_of_experience: 5)
    @tony = Mechanic.create(name:'Tony Saprano', years_of_experience: 6)

    @ride1 = @jim.rides.create(name: "Millenium Force", rating: 8, open: true)
    @ride2 = @jim.rides.create(name: "Top Thrill", rating: 10, open: true)
    @ride3 = @jim.rides.create(name: "Mantis", rating: 6, open: false)
    @ride4 = Ride.create(name: "Jemini", rating: 7, open: true)
    visit "/mechanics/#{@jim.id}"

  end
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)
  it 'has the name, years exp and the rides theyre working on, which are sorted by thrill rating' do
    #has all of the mechs info
    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@jim.years_of_experience)
    #has all of the rides associated with this mech, ordered from most thrilling to least
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride1.rating)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride2.rating)
    expect(@ride2.name).to appear_before(@ride1.name)
    #doesnt have closed rides 
    expect(page).to_not have_content(@ride3.name)
    expect(page).to_not have_content(@ride3.rating)
    #doesnt have rides not belonging to this mech
    expect(page).to_not have_content(@ride4.name)
    expect(page).to_not have_content(@ride4.rating)
  end

  #   As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page
  it 'has a form to add a ride, when filled out, takes back to the mech show page where the new ride ' do

  end
end