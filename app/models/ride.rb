class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.order_by_thrill
    order(thrill_rating: :DESC)
  end
end
