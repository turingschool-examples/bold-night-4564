class Mechanic < ApplicationRecord
  has_many :maintenances
  has_many :rides, through: :maintenances

  def self.average_years_experience
    average(:years_of_experience).to_f.round(1)
  end
end
