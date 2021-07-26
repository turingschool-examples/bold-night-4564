require "rails_helper"

RSpec.describe AmusementPark do
  describe 'relationships' do
    it  {should have_many :mechanics}
    it  {should have_many :rides}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
    it { should validate_numericality_of(:price) }
  end
end
