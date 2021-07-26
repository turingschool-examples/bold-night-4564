require 'rails_helper'

RSpec.describe 'the amechanics index page' do
  before(:each) do
    @jim = Mechanic.create(name:'Jim Bob', years_of_experience: 2)
    @sue = Mechanic.create(name:'Sue', years_of_experience: 3)
    @tim = Mechanic.create(name:'Tim Bob', years_of_experience: 5)
    @tony = Mechanic.create(name:'Tony Saprano', years_of_experience: 6)
  end

  #   As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”
  # And I see a list of all mechanic’s names and their years of experience
  # And I see the average years of experience across all mechanics
  it 'has a header titled all mechs, which has all mechs names and experience and average of all mechs' do
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@jim.years_of_experience)
    expect(page).to have_content(@sue.name)
    expect(page).to have_content(@sue.years_of_experience)
    expect(page).to have_content(@tim.name)
    expect(page).to have_content(@tim.years_of_experience)
    expect(page).to have_content(@tony.name)
    expect(page).to have_content(@tony.years_of_experience)
    expect(page).to have_content("average years of experience: 4")
  end

end