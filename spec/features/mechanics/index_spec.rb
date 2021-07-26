require 'rails_helper'

RSpec.describe 'The mechanics index page' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Frank Smith', years_of_experience: 10)
    @mechanic2 = Mechanic.create!(name: 'Joe Jones', years_of_experience: 8)

    visit '/mechanics'
  end

  it 'has a header saying all mechanics' do
    expect(page).to have_content("All Mechanics")
  end

  it 'has a list of all mechanic names and years of experience' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic1.years_of_experience)
    expect(page).to have_content(@mechanic2.years_of_experience)
  end

  it 'shows the average years experience of all mechanics' do
    expect(page).to have_content("All mechanics average years experience: 9")
  end
end
