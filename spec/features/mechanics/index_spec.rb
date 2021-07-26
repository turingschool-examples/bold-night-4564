require 'rails_helper'

RSpec.describe 'Mechanic index page' do
  # Story 1 - Mechanic Index Page
  #
  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  it 'has a header for all mechanics' do

    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
  end

  it 'lists the mechanic names and years experience' do
    mechanic_1 = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
    mechanic_2 = Mechanic.create!(name: 'Kelly M', years_of_experience: 6)

    visit '/mechanics'

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
    expect(page).to have_content(mechanic_2.years_of_experience)
  end

  it 'displays the average years experience across all mechanics' do
    mechanic_1 = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
    mechanic_2 = Mechanic.create!(name: 'Kelly M', years_of_experience: 6)

    visit '/mechanics'

    expect(page).to have_content("Average experience across mechanics: #{Mechanic.average_mechanic_experience}")
  end
end
