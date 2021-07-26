class Ride < ApplicationRecord
  has_many :maintenances
  has_many :mechanics, through: :maintenances

  def self.open_rides
    where(open: true)
  end

  def self.order_thrill
    order(thrill_rating: :desc)
  end
end
