require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do 
    it { should have_many(:maintenences) }
    it { should have_many(:rides).through(:maintenences) }
  end 

  describe 'methods' do 
    describe '::average_years' do 
      it 'can average all the years of mechanics expo' do 
        mechanic1 = Mechanic.create!(name: "Jose", years_of_experience: 10)
        mechanic2 = Mechanic.create!(name: "John", years_of_experience: 12)
        mechanic3 = Mechanic.create!(name: "Julie", years_of_experience: 14)
        mechanic4 = Mechanic.create!(name: "James", years_of_experience: 16)

        expect(Mechanic.average_years).to eq(13)
      end 
    end
  end
end
