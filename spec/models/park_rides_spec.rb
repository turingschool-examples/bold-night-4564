require 'rails_helper'

RSpec.describe ParkRide do
  describe 'relationships' do
    it { should belong_to(:park) }
    it { should belong_to(:ride) }
  end

  describe 'class methods' do

  end
  describe 'instance methods' do

  end
end