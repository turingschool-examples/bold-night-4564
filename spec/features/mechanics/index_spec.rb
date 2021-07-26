require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Jamie', years_of_experience: 12)
    @mechanic_2 = Mechanic.create!(name: 'Lydia', years_of_experience: 5)
    visit "/mechanics"
  end

  it 'lists all mechanics and attributes' do
    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_of_experience)
  end

end
