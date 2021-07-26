require "rails_helper"

RSpec.describe AmusementPark do
  it { should have_many(:rides) }
end
