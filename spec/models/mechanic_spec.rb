require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '#avg_experience' do
      it 'calculates average years of experience of all mechanics' do
        mech_1 = Mechanic.create!(name: 'Todd', years_of_experience: 6)
        mech_2 = Mechanic.create!(name: 'Bill', years_of_experience: 12)
        expect(Mechanic.avg_experience).to eq(9)
      end
    end
  end
end