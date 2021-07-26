require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '::avg_years_exp' do
      it "returns the average years of experience across all mechanics" do
        mechanic1 = Mechanic.create!(name: 'Han Solo', years_of_experience: 12)
        mechanic2 = Mechanic.create!(name: 'Leia Organa', years_of_experience: 14)

        expect(Mechanic.avg_years_exp).to eq(13)
      end
    end
  end
end
