require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    describe ':average_experience' do
      it 'shows the average experience for all mechanics' do
        mechanic1 = create(:mechanic, years_of_experience: 6)
        mechanic2 = create(:mechanic, years_of_experience: 5)
        mechanic3 = create(:mechanic, years_of_experience: 2)

        expect(Mechanic.average_experience).to eq(5)
      end
    end
  end
end
