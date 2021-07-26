class Mechanic < ApplicationRecord
  has_many :maintenences 
  has_many :rides, through: :maintenences

  def self.average_years
    average(:years_of_experience)
  end 
end
