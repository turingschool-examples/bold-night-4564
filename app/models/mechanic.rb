class Mechanic < ApplicationRecord
  has_many:assignments
  has_many:rides, through: :assignments

  def self.average_years
    average(:years_of_experience)
  end
end
