require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  # Story 1 - Mechanic Index Page
  #
  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  it 'lists all the mechanics name and their years of experience plus the average years of experience across all mechanics' do
    mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 10)
    mech2 = Mechanic.create!(name: 'Willa Wotkyns', years_of_experience: 5)
    mech3 = Mechanic.create!(name: 'Joe Dirt', years_of_experience: 15)

    visit "/mechanics"
    
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mech1.name)
    expect(page).to have_content(mech1.years_of_experience)
    expect(page).to have_content(mech2.name)
    expect(page).to have_content(mech2.years_of_experience)
    expect(page).to have_content(mech3.name)
    expect(page).to have_content(mech3.years_of_experience)
    expect(page).to have_content("Average years of experience for all mechanics: 10 years")
  end
end
