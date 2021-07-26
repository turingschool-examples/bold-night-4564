class Park < ApplicationRecord
  has_many :park_rides
  has_many :rides, through: :park_rides
end