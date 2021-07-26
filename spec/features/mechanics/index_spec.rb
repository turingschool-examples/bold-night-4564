require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Robert', years_of_experience: 27)
    @mechanic_2 = Mechanic.create!(name: 'Brian', years_of_experience: 20)
    @mechanic_3 = Mechanic.create!(name: 'Rachel', years_of_experience: 23)
    @mechanic_4 = Mechanic.create!(name: 'Holly', years_of_experience: 15)
    @mechanic_5 = Mechanic.create!(name: 'Mason', years_of_experience: 18)
  end
  #user story 1
  it 'dislpays All Mechanics' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it 'displays each mechanic name and years experience' do
    visit '/mechanics'
    
    expect(page).to have_content("Name: #{@mechanic_1.name}, Years of Experience: #{@mechanic_1.years_of_experience}")
    expect(page).to have_content("Name: #{@mechanic_2.name}, Years of Experience: #{@mechanic_2.years_of_experience}")
    expect(page).to have_content("Name: #{@mechanic_3.name}, Years of Experience: #{@mechanic_3.years_of_experience}")
    expect(page).to have_content("Name: #{@mechanic_4.name}, Years of Experience: #{@mechanic_4.years_of_experience}")
    expect(page).to have_content("Name: #{@mechanic_5.name}, Years of Experience: #{@mechanic_5.years_of_experience}")
  end

  it 'displays the average years for experience for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("Average Years of Experience: 20.6")
  end
end
