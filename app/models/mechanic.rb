class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :years_of_experience

  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_of_experience
    average(:years_of_experience).round(1)
  end
end
