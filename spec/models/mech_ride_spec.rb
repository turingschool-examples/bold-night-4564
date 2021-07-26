require 'rails_helper'

RSpec.describe MechRide do
  describe 'relationships' do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
  end

  describe 'class methods' do

  end
  describe 'instance methods' do

  end
end