require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
  # Story 1 - Mechanic Index Page
  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  it 'shows header and lists all mechanics with attributes' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Sean King', years_of_experience: 6)
    mech_3 = Mechanic.create!(name: 'Trevor King', years_of_experience: 3)

    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_2.name)
    expect(page).to have_content(mech_3.name)
    expect(page).to have_content(mech_1.years_of_experience)
    expect(page).to have_content(mech_2.years_of_experience)
    expect(page).to have_content(mech_3.years_of_experience)
  end

  it 'displays the average years of experience of all mechanics' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Sean King', years_of_experience: 6)
    mech_3 = Mechanic.create!(name: 'Trevor King', years_of_experience: 3)

    visit '/mechanics'

    expect(page).to have_content('Average Years of Experience: 5.7')
  end
end
