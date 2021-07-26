require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe '.average_years_of_experience' do
      context 'when there are no mechanics' do
        it 'returns the average years of experience' do
          expect(Mechanic.average_years_of_experience).to eq(0)
        end
      end

      context 'when there are mechanics' do
        let!(:jim) { Mechanic.create!(name: 'Jim', years_of_experience: 10) }
        let!(:john) { Mechanic.create!(name: 'John', years_of_experience: 5) }
        let!(:joe) { Mechanic.create!(name: 'Joe', years_of_experience: 3) }

        it 'returns the average years of experience' do
          expect(Mechanic.average_years_of_experience).to eq(6)
        end
      end
    end
  end
end
