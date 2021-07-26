class Mechanic < ApplicationRecord
  has_many :workloads
  has_many :rides, through: :workloads

  def self.average_mechanic_experience
    average(:years_of_experience).to_i
  end
end
