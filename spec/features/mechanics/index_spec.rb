require 'rails_helper'

RSpec.describe 'The Mechanics Index Page' do
  before :each do
    @tom = Mechanic.create!(name: "Tom", years_of_experience: 6)
    @john = Mechanic.create!(name: "John", years_of_experience: 4)
    @bob = Mechanic.create!(name: "Bob", years_of_experience: 5)

    visit mechanics_path
  end

  # Story 1 - Mechanic Index Page
  #
  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics

  it 'displays a header for all mechanics' do

    expect(page).to have_content('All Mechanics')
  end

  it 'displays a list of all mechanics and their years of experience' do

    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@tom.years_of_experience)
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@john.years_of_experience)
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@bob.years_of_experience)
  end
  it 'displays the average years of experience for all mechanics' do

    expect(page).to have_content('Average Years of Experience for All Mechanics:')
    expect(page).to have_content(Mechanic.avg_experience)
  end
end
