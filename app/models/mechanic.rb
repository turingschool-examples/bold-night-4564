class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_experience
    average(:years_of_experience).round(1).to_f
  end

  def self.add_ride(mechanic_id, ride_id)
    mechanic = find(mechanic_id)
    mechanic.rides << Ride.find(ride_id)
  end

  def open_rides
    rides.where('open = ?', true)
  end
end
