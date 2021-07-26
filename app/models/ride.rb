class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :work_orders
  has_many :mechanics, through: :work_orders
end
