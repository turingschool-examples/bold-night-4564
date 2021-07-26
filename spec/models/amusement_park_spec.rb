require "rails_helper"

RSpec.describe AmusementPark do
  describe 'associations' do
    it {should have_many :rides}
  end
end
