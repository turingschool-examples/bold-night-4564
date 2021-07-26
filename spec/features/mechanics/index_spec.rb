require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Brian', years_of_experience: 8)
    @mechanic2 = Mechanic.create!(name: 'Wyatt', years_of_experience: 3)
    @mechanic3 = Mechanic.create!(name: 'Joey', years_of_experience: 14)

    visit "/mechanics"
  end

  it 'has a header' do
    expect(page).to have_content("All Mechanics")
  end

  it 'can list names and years of experience of all mechanics' do
    within("#mechanic-#{@mechanic1.id}") do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.years_of_experience)
    end

    within("#mechanic-#{@mechanic2.id}") do
      expect(page).to have_content(@mechanic2.name)
      expect(page).to have_content(@mechanic2.years_of_experience)
    end

    within("#mechanic-#{@mechanic3.id}") do
      expect(page).to have_content(@mechanic3.name)
      expect(page).to have_content(@mechanic3.years_of_experience)
    end
  end

  it 'can display the average years of experience across all mechanics' do
    expect(page).to have_content('Average Years of Experience: 8.3')
  end
end
