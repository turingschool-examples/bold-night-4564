require "rails_helper"

RSpec.describe Mechanic do
  describe 'has relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'has methods' do
    before :each do
      @mechanic_1 = Mechanic.create!(
        name: 'Michael',
        years_of_experience: 8
      )
      @mechanic_2 = Mechanic.create!(
        name: 'Dwight',
        years_of_experience: 7
      )
      @mechanic_3 = Mechanic.create!(
        name: 'Jim',
        years_of_experience: 4
      )
      @mechanic_4 = Mechanic.create!(
        name: 'Pam',
        years_of_experience: 10
      )
    end

    it '::average_experience' do
      expect(Mechanic.average_experience).to eq(7.25)
    end
  end
end
