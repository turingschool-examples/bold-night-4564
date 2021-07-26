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

    it "displays a list of all mechanic's names and ther years of experience"

    it "displays the average years of experience across all mechanics"
  end
end
