require "rails_helper"

RSpec.describe Mechanic do
  describe 'relationships' do
    it  {should belong_to :mechanics}
    it  {should belong_to :rides}
  end
end
