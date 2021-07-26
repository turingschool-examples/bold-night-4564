class Ride < ApplicationRecord
  has_many :work_orders
  has_many :mechanics, through: :work_orders
  # belongs_to :amusement_park

  def self.order_by_thrill_rating
    order(thrill_rating: :desc)
  end
end
