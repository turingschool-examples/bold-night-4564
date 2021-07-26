require 'rails_helper'

RSpec.describe "Amusement parks show page" do
  before(:each) do
    @adventure = AmusementPark.create!(name: "Adventure Island", price: "50")
    visit "/amusementpark/#{@adventure.id}"
  end

  it "links to page" do
    expect(page).to have_content("Welcome to #{@adventure.name}!")
  end

  it "shows amusement parks attributes"

  it "shows all rides that belong to the park"

  it "shows average rating of all rides"

end
