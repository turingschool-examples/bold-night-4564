require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mech_rides) }
    it { should have_many(:rides) }
  end

  describe 'class methods' do
    describe 'av_exp' do
      it 'returns the average years of experience for a group of mechanics' do
        @jim = Mechanic.create(name:'Jim Bob', years_of_experience: 2)
        @sue = Mechanic.create(name:'Sue', years_of_experience: 3)
        @tim = Mechanic.create(name:'Tim Bob', years_of_experience: 5)
        @tony = Mechanic.create(name:'Tony Saprano', years_of_experience: 6)
        expect(Mechanic.av_exp).to eq(4)
      end
    end
  end
  describe 'instance methods' do

  end
end
