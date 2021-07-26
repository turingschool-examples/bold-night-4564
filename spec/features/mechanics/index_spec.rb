require 'rails_helper'

RSpec.describe "Mechanics index page" do
  before(:each) do
    @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)
    @sarah = Mechanic.create!(name: "Sarah", years_of_experience: 11)

    visit "/mechanics"
  end

  it "should link to page" do
    expect(page).to have_content("All Mechanics")
  end

  it "lists all mechanics" do
    expect(page).to have_content("Bob")
    expect(page).to have_content("Sarah")
  end

  it "has average years of experience from all mechanics" do
    expect(page).to have_content(11.5)
  end
end
