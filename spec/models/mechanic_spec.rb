require "rails_helper"

RSpec.describe Mechanic do
  describe 'associations' do
    it {should have_many :work_orders}
    it {should have_many(:rides).through(:work_orders)}
  end

  describe 'class methods' do
    describe '::average_mechanic_experience' do
      it 'returns the average years experience for all mechanics' do
        mechanic1 = Mechanic.create!(name: 'Joe Schmo', years_of_experience: 10)
        mechanic2 = Mechanic.create!(name: 'Walter White', years_of_experience: 4)
        expect(Mechanic.average_mechanic_experience).to eq(7)
      end
    end
  end
end
