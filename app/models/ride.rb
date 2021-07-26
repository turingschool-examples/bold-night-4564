class Ride < ApplicationRecord
  has_many :mech_rides
  has_many :mechanics, through: :mech_rides

  def self.is_open
    where(open: :true)
  end

end