class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates :name, presence: true
  validates :years_of_experience, presence: true

  def self.average_years_experience
    average(:years_of_experience).round(2)
  end
end
