class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_years_exp
    average(:years_of_experience)
  end

  def open_rides_by_thrill_desc
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
