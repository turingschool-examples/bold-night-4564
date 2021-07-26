class Mechanic < ApplicationRecord

  def self.average_years_experience
    average(:years_of_experience).round(2)
  end
end
