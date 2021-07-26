require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :work_orders}
    it {should have_many(:rides).through(:work_orders)}
  end

  describe 'class methods' do
    describe '::avg_experience' do
      it 'can return the average years of experience for all mechanics' do
        tom = Mechanic.create!(name: "Tom", years_of_experience: 6)
        john = Mechanic.create!(name: "John", years_of_experience: 4)
        bob = Mechanic.create!(name: "Bob", years_of_experience: 5)

        expect(Mechanic.avg_experience).to eq(5)
      end
    end
  end
end
