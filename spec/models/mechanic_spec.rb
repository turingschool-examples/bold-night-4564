require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:workloads) }
    it { should have_many(:rides).through(:workloads) }
  end

  describe 'class methods' do
    describe '::average_mechanic_experience' do
      it 'returns the average years experience for all mechanics' do
        mechanic_1 = Mechanic.create!(name: 'Jamison O', years_of_experience: 10)
        mechanic_2 = Mechanic.create!(name: 'Kelly M', years_of_experience: 6)

        expect(Mechanic.average_mechanic_experience).to eq(8)
      end
    end
  end
end
