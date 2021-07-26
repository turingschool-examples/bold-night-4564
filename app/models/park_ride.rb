class ParkRide < ApplicationRecord
  belongs_to :park
  belongs_to :ride
end