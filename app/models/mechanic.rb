class Mechanic < ApplicationRecord
  has_many :maintenences
  has_many :rides, through: :maintenences

  def self.average_experience
    average(:years_of_experience).to_i
  end

  def working_open_rides
    rides.where(open: true)
  end
end
