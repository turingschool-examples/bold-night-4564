require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :maintenences}
    it {should have_many(:rides).through(:maintenences)}
  end

  describe 'class methods'do
    it 'can average years_of_experience' do
      mech_1 = Mechanic.create!(name: 'Bubbles', years_of_experience: 5)
      mech_2 = Mechanic.create!(name: 'Ricky', years_of_experience: 15)
      mech_3 = Mechanic.create!(name: 'Julian', years_of_experience: 10)

      expect(Mechanic.average_experience).to eq(8)
    end
  end
end
