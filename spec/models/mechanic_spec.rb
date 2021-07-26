require "rails_helper"

RSpec.describe Mechanic do

  describe 'Relationships' do
  it { should have_many :ride_mechanics}
  it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: 'Robert', years_of_experience: 27)
      @mechanic_2 = Mechanic.create!(name: 'Brian', years_of_experience: 20)
      @mechanic_3 = Mechanic.create!(name: 'Rachel', years_of_experience: 23)
      @mechanic_4 = Mechanic.create!(name: 'Holly', years_of_experience: 15)
      @mechanic_5 = Mechanic.create!(name: 'Mason', years_of_experience: 18)
    end
    
    describe '::avg_years_of_experience' do
      it 'returns the average years of experience for all mechanics' do
        expect(Mechanic.avg_years_of_experience).to eq(20.6)
      end
    end
  end
end
