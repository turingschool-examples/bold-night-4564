require 'rails_helper'

RSpec.describe MechanicRide do
  describe 'relationships' do
    it { should belong_to(:mechanic) }
    tt { should belong_to(:ride) }
  end
end
