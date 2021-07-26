require 'rails_helper'

RSpec.describe '/mechanics/index.html.erb' do
  describe 'as a user' do
    describe 'when I visit the mechanics index page' do
      let!(:jim) { Mechanic.create!(name: 'Jim', years_of_experience: 10) }
      let!(:john) { Mechanic.create!(name: 'John', years_of_experience: 5) }
      let!(:joe) { Mechanic.create!(name: 'Joe', years_of_experience: 3) }

      before do
        visit '/mechanics/'
      end

      it 'displays a header saying "All Mechanics"' do
        expect(page).to have_content('All Mechanics')
      end

      it 'displays a list of all mechanics names and their years experience' do
        Mechanic.all.each do |mechanic|
          expect(page).to have_content(mechanic.name)
          expect(page).to have_content(mechanic.years_of_experience)
        end
      end

      it 'displays the average years of experience across all mechanics' do
        expect(page).to have_content('Average Years of Experience: 6')
      end
    end
  end
end
