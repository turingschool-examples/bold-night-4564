require "rails_helper"

RSpec.describe AmusementPark do

  describe 'Relationships' do
    it { should have_many :rides }
  end

end
