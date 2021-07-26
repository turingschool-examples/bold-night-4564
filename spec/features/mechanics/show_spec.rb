require "rails_helper" 

RSpec.describe 'Mechanics Show Page' do 
  before :each do 
    @mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
    @ride1 = Ride.create!(name: "twister", thrill: 20, open: true)
    @ride2 = Ride.create!(name: "mind-eraser", thrill: 50, open: true)
    @ride3 = Ride.create!(name: "broken carousel", thrill: 2, open: false)
    @ride4 = Ride.create!(name: "crazitown", thrill: 100, open: true)
    Maintenence.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    Maintenence.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
    Maintenence.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)

    visit "/mechanics/#{@mechanic1.id}" 
  end 
  it 'is on the right page' do 
    expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
  end 

  it 'can display all of the mechanics attributes' do 
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_of_experience)
  end

  it 'can display all the currently OPEN rides the mechanic is working on ordered by thrill' do 
    expect(page).to have_content("Rides Being Worked On:")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)

    expect(@ride2.name).to appear_before(@ride1.name)
  end
end