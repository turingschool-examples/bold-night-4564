require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:mech_rides) }
    it { should have_many(:mechanics) }
  end

  describe 'class methods' do

  end
  describe 'instance methods' do

  end
end