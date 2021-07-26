class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years_experience
    average(:years_of_experience).round(0)
  end

  def open_rides_working_on
    rides.where(open: true)
  end

  def open_rides_by_thrill
    open_rides_working_on.order(thrill_rating: :desc)
  end
end
