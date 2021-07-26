require "rails_helper"

RSpec.describe 'the mechanics index' do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: 'Nick McIntyre', years_of_experience: 10)
    @mechanic_2 = Mechanic.create(name: 'Lee Hopper', years_of_experience: 5)
    @mechanic_3 = Mechanic.create(name: 'Cody Eldredge', years_of_experience: 7)
  end

  it 'lists all mechanic names and years of experience' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')

    within("#mechanic-#{@mechanic_1.id}") do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_of_experience)
    end

    within("#mechanic-#{@mechanic_2.id}") do
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_of_experience)
    end

    within("#mechanic-#{@mechanic_2.id}") do
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_of_experience)
    end
  end

  it 'displays the average years of experience for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("Average Years of Experience: 7.3")
  end
end
