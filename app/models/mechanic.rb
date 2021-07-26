class Mechanic < ApplicationRecord
  has_many :mech_rides
  has_many :rides, through: :mech_rides
end
