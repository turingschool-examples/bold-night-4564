require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'can find the average years of experence of all mechanics' do
      mech1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 12)
      mech2 = Mechanic.create!(name: 'Willa Wotkyns', years_of_experience: 8)
      mech3 = Mechanic.create!(name: 'Joe Dirt', years_of_experience: 14)

      expect(Mechanic.average_years_experience).to eq(11)
    end
  end
end
