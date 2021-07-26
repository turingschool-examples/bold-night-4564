require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Jamie', years_of_experience: 12)
    @mechanic_2 = Mechanic.create!(name: 'Lydia', years_of_experience: 5)
  end

  describe 'class methods' do
    describe '.average_years_experience' do
      it 'can return average years of experience for all mechanics' do
        expect(Mechanic.average_years_experience).to eq(8.5)
      end
    end
  end
end
