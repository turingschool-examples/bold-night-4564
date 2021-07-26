class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_years_of_experience
    average(:years_of_experience).to_f
  end

  def open_rides_desc_by_thrill_rating
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
