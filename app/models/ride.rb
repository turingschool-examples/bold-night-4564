class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  belongs_to :amusement_park
  def self.open_rides
    Ride.where(open: true)
  end

  def self.order_by_thrills
    Ride.order(thrill_rating: :desc)
  end
end
