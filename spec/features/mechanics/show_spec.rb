require 'rails_helper'

RSpec.describe "Mechanics show page" do
  before(:each) do
    @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)

    visit "/mechanics/#{@bob.id}"
  end

  it "should link to page and display bobs attributes" do
    expect(page).to have_content("Bob's Page")
    expect(page).to have_content(12)
  end

  it "lists all the rides that they are working on" 


  it "all rides are listed by thrill rating descending order"

end
