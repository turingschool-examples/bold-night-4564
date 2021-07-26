class Mechanic < ApplicationRecord
  has_many:assignments
  has_many:rides, through: :assignments

  def self.average_years
    average(:years_of_experience)
  end

  def open_rides
    self.rides.where(open: true).order(thrill_rating: :desc)
  end
end
