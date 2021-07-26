class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides
    where(open:true)
  end

  def self.high_to_low_thrills
    order('thrill_rating DESC')
  end
end
