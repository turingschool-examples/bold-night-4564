require 'rails_helper'

RSpec.describe 'mechanic index' do
  it 'lists all mechanics names and years of exp with avg age' do
    mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
    mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)
    mech_3 = Mechanic.create!(name: 'Julian', years_of_experience: 10)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_of_experience)
    expect(page).to have_content(mech_2.name)
    expect(page).to have_content(mech_2.years_of_experience)
    expect(page).to have_content(mech_3.name)
    expect(page).to have_content(mech_3.years_of_experience)
    expect(page).to have_content("Average experience in years:")
  end
end
