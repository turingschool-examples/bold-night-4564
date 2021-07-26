class Ride < ApplicationRecord
  has_many :mechanic_rides, :dependent => :destroy
  has_many :mechanics, through: :mechanic_rides
  belongs_to :amusement_park

  def self.open
    where(open: true)
  end

  def self.order_by_most_thrilling
    order('thrill_rating desc')
  end

  def self.order_by_name
    order(:name)
  end

  def self.average_thrill_rating
    average(:thrill_rating).round(1)
  end
end
