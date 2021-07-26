require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:park_rides) }
  end

  describe 'class methods' do

  end
  describe 'instance methods' do

  end
end