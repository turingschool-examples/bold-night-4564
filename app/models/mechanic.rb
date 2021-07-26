class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_years_of_experience
    average(:years_of_experience).to_f
  end
end
