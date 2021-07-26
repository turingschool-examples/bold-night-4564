require 'rails_helper'

RSpec.describe 'mechanic index page' do
  describe 'contents' do
    it 'displays a list of all mechanic names and years of experience' do
      mechanic1 = create(:mechanic)
      mechanic2 = create(:mechanic)

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content("Name: #{mechanic1.name}")
      expect(page).to have_content("Experience: #{mechanic1.years_of_experience}")
      expect(page).to have_content("Name: #{mechanic2.name}")
      expect(page).to have_content("Experience: #{mechanic2.years_of_experience}")
    end

    it 'shows the average years ecperience for all mechanics' do
      mechanic1 = create(:mechanic, years_of_experience: 6)
      mechanic2 = create(:mechanic, years_of_experience: 4)

      visit '/mechanics'

      expect(page).to have_content("Years of Experience: 5")
      # As a user,
      # When I visit the mechanics index page
      # I see a header saying “All Mechanics”
      # And I see a list of all mechanic’s names and their years of experience
      # And I see the average years of experience across all mechanics
    end
  end
end
