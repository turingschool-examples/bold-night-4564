require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many(:maintenances)}  
    it {should have_many(:rides).through(:maintenances)}  
  end    

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Dee', years_of_experience: 4)  
    @mechanic_2 = Mechanic.create!(name: 'Leon', years_of_experience: 6)  
    @mechanic_3 = Mechanic.create!(name: 'Bruce', years_of_experience: 2)  
    @mechanic_4 = Mechanic.create!(name: 'Zerry', years_of_experience: 2)
  end

  describe 'class methods' do
    it 'displays the average' do
      expect(Mechanic.average_years).to eq(0.35e1)  
    end
  end
end
