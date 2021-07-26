require 'rails_helper'
RSpec.describe 'it shows the specific show page for a certain mechanic and all details about them' do
  before :each do
    @ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
    @ride2 = Ride.create!(name: "Side Winder", thrill_rating: 4, open: true)
    @ride3 = Ride.create!(name: "Tower O Doom", thrill_rating: 10, open: true)
    @ride4 = Ride.create!(name: "Shake Rattle and Roll", thrill_rating: 1, open: false)
    @ride5 = Ride.create!(name: "Twister 2 ", thrill_rating: 9, open: true)

    @mechanic1 = Mechanic.create!(name: "Bob", years_of_experience: 7)
    @mechanic2 = Mechanic.create!(name: "Jim", years_of_experience: 1)
    @mechanic3 = Mechanic.create!(name: "Clyde", years_of_experience: 3)
    @mechanic4 = Mechanic.create!(name: "Charles", years_of_experience: 10)

    @maintenance1 = Maintenance.create!(mechanic_id: @mechanic4.id, ride_id: @ride4.id)
    @maintenance2 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride4.id)
    @maintenance3 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride3.id)
    @maintenance4 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride3.id)
    @maintenance5 = Maintenance.create!(mechanic_id: @mechanic2.id, ride_id: @ride2.id)
    @maintenance6 = Maintenance.create!(mechanic_id: @mechanic3.id, ride_id: @ride1.id)
    @maintenance7 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
    @maintenance8 = Maintenance.create!(mechanic_id: @mechanic1.id, ride_id: @ride2.id)


    visit "/mechanics/#{@mechanic1.id}"
  end

  it 'can visit the show page' do
    expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
  end

  it 'can show the attributes of that certain mechanic such as name, years of experience' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_of_experience)

    expect(page).to_not have_content(@mechanic2.name)
  end

  it 'can also show all the rides that are associated with mehcanic' do
    expect(page).to have_content(@ride3.name)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)

    expect(@ride3.name).to appear_before(@ride1.name)
    expect(@ride1.name).to appear_before(@ride2.name)
    
    expect(page).to_not have_content(@ride4.name)
  end

  it 'can fill out the form to add to their workload' do
    fill_in('Ride I.D.', with: @ride5.id)
    
    click_button("Add This Ride")

    expect(current_path).to eq("/mechanics/#{@mechanic1.id}")

    expect(page).to have_content(@ride5.name)
    
    expect(@ride3.name).to appear_before(@ride5.name)
    expect(@ride5.name).to appear_before(@ride1.name)
  end
end