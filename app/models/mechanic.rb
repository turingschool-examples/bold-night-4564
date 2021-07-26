class Mechanic < ApplicationRecord
  has_many :maintenances
  has_many :rides, through: :maintenances

  def self.average_years
    average(:years_of_experience)  
  end
end
