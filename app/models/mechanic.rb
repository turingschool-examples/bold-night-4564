class Mechanic < ApplicationRecord
  has_many :workloads
  has_many :rides, through: :workloads

  def self.average_mechanic_experience
    average(:years_of_experience).to_i
  end

  def open_rides_by_thrill_rating
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
