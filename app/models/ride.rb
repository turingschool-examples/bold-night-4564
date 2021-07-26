class Ride < ApplicationRecord
  has_many :maintenances
  has_many :mechanics, through: :maintenances
end