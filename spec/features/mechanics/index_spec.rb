require 'rails_helper'

RSpec.describe '/mechanics/index.html.erb' do
  describe 'as a user' do
    describe 'when I visit the mechanics index page' do
      it 'displays a header saying "All Mechanics"' do
        visit '/mechanics/'

        expect(page).to have_content('All Mechanics')
      end

      xit 'displays a list of all mechanics names and their years experience' do

      end

      xit 'displays the average years of experience across all mechanics' do

      end
    end
  end
end
