class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_in_alphabetical_order
    rides.order(:name)
  end

  def average_thrill_rating_of_rides
    rides.average(:thrill_rating).round(1)
  end
end
