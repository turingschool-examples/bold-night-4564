class Mechanic < ApplicationRecord
  def self.average_years_of_experience
    count.positive? ? average(:years_of_experience) : 0
  end
end
