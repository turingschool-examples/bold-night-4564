class Mechanic < ApplicationRecord
  has_many :maintenences
  has_many :rides, through: :maintenences

  def self.average_experience
    average(:years_of_experience).to_i
  end

  def working_open_rides
    rides.where(open: true)
  end

  def order_by_open_thrill
    working_open_rides.order(thrill_rating: 'DESC')
  end
end
