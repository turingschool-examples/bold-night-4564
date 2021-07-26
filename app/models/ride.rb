class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.order_by_thrill
    order(thrill_rating: :desc)
  end
end
