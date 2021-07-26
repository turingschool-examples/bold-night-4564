require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before :each do
    @mech_1 = Mechanic.create!(name: 'Todd', years_of_experience: 6)
    @mech_2 = Mechanic.create!(name: 'Bill', years_of_experience: 12)
  end

  it 'displays list of mechanics and their information' do
    visit '/mechanics'
    expect(page).to have_content('All Mechanics')
    expect(page).to have_content('Todd')
    expect(page).to have_content('6 Years of Experience')
    expect(page).to have_content('Bill')
    expect(page).to have_content('6 Years of Experience')
    expect(page).to have_content('Average Years of Experience: 9')
  end
end