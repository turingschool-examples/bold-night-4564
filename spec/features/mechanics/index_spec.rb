require 'rails_helper'

RSpec.describe 'The Mechanics index page' do
  describe 'story 1' do
    # As a user,
    # When I visit the mechanics index page
    # I see a header saying “All Mechanics”
    # And I see a list of all mechanic’s names and their years of experience
    # And I see the average years of experience across all mechanics

    it "displays an 'All Mechanics' header" do
      visit "/mechanics"

      expect(page).to have_content('All Mechanics')
    end

    it "displays a list of all mechanic's names and their years of experience" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
      mechanic2 = Mechanic.create!(name: 'Leia Organa', years_of_experience: 14)

      visit "/mechanics"

      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_of_experience)
      expect(page).to have_content(mechanic2.name)
      expect(page).to have_content(mechanic2.years_of_experience)
    end

    it "displays the average years of experience across all mechanics" do
      mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
      mechanic2 = Mechanic.create!(name: 'Leia Organa', years_of_experience: 14)

      visit "/mechanics"

      expect(page).to have_content('Average years of experience across all mechanics: 13')
    end
  end
end
