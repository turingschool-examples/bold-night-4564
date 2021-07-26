require "rails_helper"

RSpec.describe 'Mechanics Index' do
  describe 'visitor' do
    it 'displays all mechanics and years of experience' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)
      mike = Mechanic.create!(name: 'Mike', years_of_experience: 8)
      visit '/mechanics'

      expect(page).to have_content('All Mechanics')
      expect(page).to have_content('Lily')
      expect(page).to have_content('Years of Experience: 10')
      expect(page).to have_content('Mike')
      expect(page).to have_content('Years of Experience: 8')
    end

    it 'displays average years of experience' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)
      mike = Mechanic.create!(name: 'Mike', years_of_experience: 8)
      visit '/mechanics'

      expect(page).to have_content('Average Years of Experience: 9')
    end
  end
end
