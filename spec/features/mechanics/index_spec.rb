require 'rails_helper'

RSpec.describe 'the mechanics index' do
  before :each do
    @mechanic_1 = Mechanic.create!(
      name: 'Michael',
      years_of_experience: 8
    )
    @mechanic_2 = Mechanic.create!(
      name: 'Dwight',
      years_of_experience: 7
    )
    @mechanic_3 = Mechanic.create!(
      name: 'Jim',
      years_of_experience: 4
    )
    @mechanic_4 = Mechanic.create!(
      name: 'Pam',
      years_of_experience: 10
    )
  end

  it 'lists all the mechanics names' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content('Michael')
    expect(page).to have_content('Dwight')
    expect(page).to have_content('Jim')
    expect(page).to have_content('Pam')
  end

  it 'lists all the mechanics years of experience' do

  end

  it 'shows the average experience of all the mechanics' do

  end
end
