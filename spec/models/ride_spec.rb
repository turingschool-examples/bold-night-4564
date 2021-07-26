require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it  {should have_many :maintenances}
    it  {should have_many(:mechanics).through(:maintenances)}
  end
end
