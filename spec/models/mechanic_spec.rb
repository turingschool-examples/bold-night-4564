require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:workloads) }
    it { should have_many(:rides).through(:workloads) }
  end
end
