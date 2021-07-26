require "rails_helper"

RSpec.describe Ride do
  describe 'relationships' do
    it {should belong_to(:park)}
    it {should have_many :maintenences}
    it {should have_many(:mechanics).through(:maintenences)}
  end
end
