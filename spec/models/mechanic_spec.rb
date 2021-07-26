require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :assignments}
    it {should have_many(:rides).through(:assignments)}
  end

  describe 'Class methods' do
    it 'can calculate average years' do
      lily = Mechanic.create!(name: 'Lily', years_of_experience: 10)
      mike = Mechanic.create!(name: 'Mike', years_of_experience: 8)

      expect(Mechanic.average_years).to eq(9)
    end
  end
end
