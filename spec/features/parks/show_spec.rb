require "rails_helper" 

RSpec.describe 'Parks Show Page' do 
  before :each do 
    @park1 = Park.create!(name: "6Flags", price: 20)
    @mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
    @ride1 = Ride.create!(name: "twister", thrill: 20, open: true, park_id: @park1.id)
    @ride2 = Ride.create!(name: "mind-eraser", thrill: 50, open: true, park_id: @park1.id)
    @ride3 = Ride.create!(name: "broken carousel", thrill: 2, open: false, park_id: @park1.id)
    @ride4 = Ride.create!(name: "crazitown", thrill: 100, open: true, park_id: @park1.id)
    Maintenence.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    Maintenence.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
    Maintenence.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)

    visit "/parks/#{@park1.id}"
  end 

  it 'is on the right page' do 
  end 
   
  it ' displays the attributes of park' do 
    expect(page).to have_content(@park1.name)
    expect(page).to have_content(@park1.price)
  end

  it ' displays that parks rides' do 
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to have_content(@ride4.name)
  end

  it 'displays average thrill rating' do 
    expect(page).to have_content('Average Thrill Rating: 43')
  end
end 