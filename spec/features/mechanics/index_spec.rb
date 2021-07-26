require 'rails_helper'

RSpec.describe "Mechanics index page" do
  before(:each) do
    @bob = Mechanic.new(name: "Bob", years_experience: 12)
    @sarah = Mechanic.new(name: "Sarah", years_experience: 11)

    visist "/mechanics"
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
