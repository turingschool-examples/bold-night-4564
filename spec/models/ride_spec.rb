require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end
end
