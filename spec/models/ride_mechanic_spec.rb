require "rails_helper"

RSpec.describe RideMechanic do

  describe 'Relationships' do
  it { should belong_to :mechanic }
  it { should belong_to :ride }
  end
end
