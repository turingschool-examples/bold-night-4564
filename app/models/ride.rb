class Ride < ApplicationRecord
  has_many :mechanic_rides, :dependent => :destroy
  has_many :mechanics, through: :mechanic_rides

  def self.open
    where(open: true)
  end

  def self.closed
    where(open: false)
  end

  def self.order_by_most_thrilling
    order('thrill_rating desc')
  end
end
