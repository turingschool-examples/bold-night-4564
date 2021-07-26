require 'rails_helper'

RSpec.describe 'The Amusement Park show page' do
  describe 'Extension - Amusement Park Show page' do
    # When I visit an amusement park’s show page
    # I see the name and price of admissions for that amusement park
    # And I see the names of all the rides that are at that theme park listed in alphabetical order
    # And I see the average thrill rating of this amusement park’s rides

    it "displays the name and price of admissions for that amusement park" do
      park1 = AmusementPark.create!(name: 'Happy Flags', admission_price: 25.00)
    end

    it "displays the names of all the rides that are at that theme park listed in alphabetical order"

    it "displays the average thrill rating of this amusement park’s rides"
  end
end
