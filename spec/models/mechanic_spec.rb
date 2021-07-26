require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe '.average_years_of_experience' do
      context 'when there are no mechanics' do
        it 'returns the average years of experience' do
          Mechanic.destroy_all
          expect(Mechanic.average_years_of_experience).to eq(0)
        end
      end

      context 'when there are mechanics' do
        it 'returns the average years of experience' do
          Mechanic.create!(name: 'Jim', years_of_experience: 10)
          Mechanic.create!(name: 'John', years_of_experience: 5)
          Mechanic.create!(name: 'Joe', years_of_experience: 3)

          expect(Mechanic.average_years_of_experience).to eq(6)
        end
      end
    end
  end

  describe 'instance methods' do
    let!(:jim) { Mechanic.create!(name: 'Jim', years_of_experience: 10) }

    let!(:frog_hopper) do
      jim.rides.create!(
        name: "The Frog Hopper",
        thrill_rating: 4,
        open: true,
      )
    end

    let!(:fahrenheit) do
      jim.rides.create!(
        name: "Fahrenheit",
        thrill_rating: 10,
        open: true,
      )
    end

    let!(:kiss_raise) do
      jim.rides.create!(
        name: "The Kiss Raise",
        thrill_rating: 2,
        open: false,
      )
    end

    let!(:open_rides) { [frog_hopper, fahrenheit] }

    describe '#open_rides' do
      it 'returns all open rides for a mechanic' do
        expect(jim.open_rides).to eq(open_rides)
      end
    end
  end
end
