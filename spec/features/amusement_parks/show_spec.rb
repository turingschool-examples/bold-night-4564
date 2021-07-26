require 'rails_helper'

RSpec.describe 'Amusement Park Show page' do
  before :each do
    bells = AmusementPark.create!()
  end

  # Extension - Amusement Park Show page
  #
  # As a visitor,
  # When I visit an amusement park’s show page
  # I see the name and price of admissions for that amusement park
  # And I see the names of all the rides that are at that theme park listed in alphabetical order
  # And I see the average thrill rating of this amusement park’s rides

  it 'can display the name and price of admission for a particular amusement park'
  it 'displays all the rides associated with a particular park in alphabetical order'
  it 'displays the average thrill rating for the rides at the park'
end
