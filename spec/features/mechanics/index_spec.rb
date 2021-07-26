require 'rails_helper'

RSpec.describe 'Mechanics index page', type: :feature do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Handy Manny', years_of_experience: 10)
    @mechanic_2 = Mechanic.create!(name: 'Fonzie', years_of_experience: 7)
    @mechanic_3 = Mechanic.create!(name: 'R2D2', years_of_experience: 15)
  end

  # User Story 1
  it 'displays All Mechanics header, attributes, and average years of experience' do
    visit "/mechanics"
    save_and_open_page
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_3.years_of_experience)
    expect(page).to have_content("Total Average Years of Experience: 10.67")
  end
end
