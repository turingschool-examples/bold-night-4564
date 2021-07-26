class Ride < ApplicationRecord
  has_many :mech_rides
  has_many :mechanics, through: :mech_rides
end