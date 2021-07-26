class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics, -> { order(thrill_rating: :desc)}
end
