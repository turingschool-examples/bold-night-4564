require 'rails_helper'

RSpec.describe ApplicationRecord do
describe 'relationships' do

end

describe 'class methods' do
  before(:each) do      
    @jim = Mechanic.create(name:'Jim Bob', years_of_experience: 2)
    @sue = Mechanic.create(name:'Sue', years_of_experience: 3)
    @tim = Mechanic.create(name:'Tim Bob', years_of_experience: 5)
    @tony = Mechanic.create(name:'Tony Saprano', years_of_experience: 6)

    @ride1 = @jim.rides.create(name: "Millenium Force", thrill_rating: 8, open: true)
    @ride2 = @jim.rides.create(name: "Top Thrill", thrill_rating: 10, open: true)
    @ride3 = @jim.rides.create(name: "Mantis", thrill_rating: 6, open: false)
    @ride4 = Ride.create(name: "Jemini", thrill_rating: 7, open: true)
  end
  describe 'sort_by_input' do
    it 'sorts a table by given column name in order given' do
      expect(Ride.sort_by_input("thrill_rating", "desc")).to eq([@ride2, @ride1, @ride4, @ride3])
    end
  end
  describe 'average_by' do
    it 'given a table and column, returns the average of that column' do
      expect(Ride.average_by("thrill_rating")).to eq(7.75)
    end
  end
end
describe 'instance methods' do

end
end