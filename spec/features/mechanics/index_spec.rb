require "rails_helper" 

RSpec.describe 'Mechanics Index Page' do 
  before :each do 
    @mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
    @mechanic2 = Mechanic.create!(name: "John", years_of_experience: 12)
    @mechanic3 = Mechanic.create!(name: "Julie", years_of_experience: 14)
    @mechanic4 = Mechanic.create!(name: "James", years_of_experience: 16)

    visit '/mechanics' 
  end 
  it 'is on the right page' do 
    expect(current_path).to eq('/mechanics')
  end 
  it 'can display all mechanics' do 
    expect(page).to have_content('All Mechanics')

    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic3.name)
    expect(page).to have_content(@mechanic4.name)
  end 

  it 'can display avg yrs of experience' do 
    expect(page).to have_content("Average Years of Experience: 13")
  end 
end