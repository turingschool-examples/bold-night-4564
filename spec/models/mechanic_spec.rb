require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  before(:each) do
    @mechanic_1 = Mechanic.create(name: 'Nick McIntyre', years_of_experience: 10)
    @mechanic_2 = Mechanic.create(name: 'Lee Hopper', years_of_experience: 5)
    @mechanic_3 = Mechanic.create(name: 'Cody Eldredge', years_of_experience: 7)
  end

  describe 'class methods' do
    describe '.average_experience' do
      it 'returns the average years of experience for all mechanics' do
        expect(Mechanic.average_experience).to eq(7.3)
      end
    end
  end
end
