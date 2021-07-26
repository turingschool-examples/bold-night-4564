class Ride < ApplicationRecord
  has_many :mech_rides
  has_many :mechanics, through: :mech_rides

  def self.sort_by_thrill
    order(thrill_rating: :desc)
  end

  def self.is_open
    where(open: :true)
  end
end