require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Dee', years_of_experience: 4)  
    @mechanic_2 = Mechanic.create!(name: 'Leon', years_of_experience: 6)  
    @mechanic_3 = Mechanic.create!(name: 'Bruce', years_of_experience: 2)  
    @mechanic_4 = Mechanic.create!(name: 'Zerry', years_of_experience: 2)  

    visit '/mechanics'
  end

  describe 'visit' do
    it 'Displays all Mechanics and attributes' do
      
      expect(page).to have_content('All Mechanics')
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_of_experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_of_experience)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_of_experience)
      expect(page).to have_content(@mechanic_4.name)
      expect(page).to have_content(@mechanic_4.years_of_experience)
    end

    it 'displays average years of experience' do

      expect(page).to have_content('Average Years of Experience: 3.5')
    end
  end  
end