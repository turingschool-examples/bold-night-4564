require "rails_helper"

RSpec.describe Mechanic do
  describe "relationships" do
    it {should have_many :maintenances}
    it {should have_many(:rides).through(:maintenances)}
  end

  it 'averages years of experience' do
    mech_1 = Mechanic.create!(name: 'Antonio King', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Sean King', years_of_experience: 6)
    mech_3 = Mechanic.create!(name: 'Trevor King', years_of_experience: 3)
    
    expect(Mechanic.average_years_experience).to eq(5.7)
  end
end
