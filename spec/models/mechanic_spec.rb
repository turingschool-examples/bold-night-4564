require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it  {should have_many :maintenances}
    it  {should have_many(:rides).through(:maintenances)}
  end

  describe "class methods" do
    before(:each) do
      @bob = Mechanic.create!(name: "Bob", years_of_experience: 12)
      @sarah = Mechanic.create!(name: "Sarah", years_of_experience: 11)
    end
    it "should show the average years experience for all mechanics" do
      expect(Mechanic.average_years_experience).to eq(11.5)
    end
  end
end
