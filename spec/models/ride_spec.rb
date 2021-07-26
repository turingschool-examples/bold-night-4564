require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many(:workloads) }
    it { should have_many(:mechanics).through(:workloads) }
  end
end
