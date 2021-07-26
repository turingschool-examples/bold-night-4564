class Mechanic < ApplicationRecord
  has_many :mechanic_rides, :dependent => :destroy
  has_many :rides, through: :mechanic_rides

  def self.average_years_of_experience
    count.positive? ? average(:years_of_experience) : 0
  end
end
