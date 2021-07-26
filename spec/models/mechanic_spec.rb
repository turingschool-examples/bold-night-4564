require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_of_experience) }
  end

  before :each do
    @mechanic1 = Mechanic.create!(name: 'Brian', years_of_experience: 6)
    @mechanic2 = Mechanic.create!(name: 'Wyatt', years_of_experience: 2)
    @mechanic3 = Mechanic.create!(name: 'Joey', years_of_experience: 21)
  end

  describe 'class methods' do
    it 'can calculate .average_year_of_experience' do
      expect(Mechanic.average_years_of_experience).to eq(9.7)
    end
  end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
